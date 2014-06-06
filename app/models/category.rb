class Category < ActiveRecord::Base
  default_scope { order(:order) }
  scope :root, -> do
    Rails.cache.fetch collection_cache_key do
      where(parent: nil).includes(:children).all
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

  def self.collection_cache_key
    count, max_updated_at = Category.pluck("COUNT(*)", "MAX(updated_at)").flatten
    "categories/all-#{count}-#{max_updated_at.try(:to_datetime).try(:to_i)}"
  end
end
