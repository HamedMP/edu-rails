class Category < ActiveRecord::Base
  after_update { Rails.cache.delete [self.class.name, self.slug] }

  default_scope { order(:order) }
  scope :root, -> do
    Rails.cache.fetch [collection_cache_key, :root] do
      where(parent: nil).includes(:children).load
    end
  end
  scope :random, ->(category, limit=nil) do
    Rails.cache.fetch [category, :random, limit], expires_in: 1.hour do
      unscoped.order("RANDOM()").where.not(id: category.id).limit(limit)
    end
  end

  validates :title, presence: true
  validates :slug, presence: true, uniqueness: true

  has_many :children, class_name: 'Category',
                      foreign_key: 'category_id',
                      dependent: :destroy

  belongs_to :parent, class_name: 'Category',
                      foreign_key: 'category_id',
                      touch: true

  has_many :posts, dependent: :destroy

  def up_tree
    ancestor_list = [self]
    current_category = self
    while current_category.parent
      current_category = current_category.parent
      ancestor_list << current_category
    end
    ancestor_list.reverse
  end

  def down_roots(category = self)
    if category.children.any?
      descendants = category.children.to_a
      category.children.each do |cat|
        descendants += down_roots(cat)
      end
      descendants.uniq
    else
      [self]
    end
  end

  def to_param
    slug
  end

  def self.cached_find_by_slug(slug)
    Rails.cache.fetch [self.class.name, slug] do
      find_by(slug: slug)
    end
  end

  def self.collection_cache_key
    count, max_updated_at = Category.unscoped.pluck('COUNT(*)', 'MAX("categories"."updated_at")').flatten
    "categories/all-#{count}-#{max_updated_at.try(:to_datetime).try(:to_i)}"
  end
end
