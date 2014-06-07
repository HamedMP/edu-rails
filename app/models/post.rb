class Post < ActiveRecord::Base
  include ActionView::Helpers::SanitizeHelper

  before_save :check_vacancy
  after_update { Rails.cache.delete [self.class.name, self.slug] }
  before_save { self.raw_text = strip_tags(self.body) + ' ' + self.title }

  default_scope { order(published_at: :desc) }

  scope :non_featured_vacancies, ->(limit=nil) do
    Rails.cache.fetch [collection_cache_key, :non_featured_vacancies, limit] do
      where(is_vacancy: true, is_featured: false).includes(:category).limit(limit).load
    end
  end
  scope :featured, ->(limit=nil) do
    Rails.cache.fetch [collection_cache_key, :featured, limit] do
      where(is_featured: true).includes(:category).limit(limit).load
    end
  end
  scope :ordinary, ->(limit=nil) do
    Rails.cache.fetch [collection_cache_key, :ordinary, limit] do
      where(is_featured: false, is_vacancy: false).includes(:category).limit(limit).load
    end
  end
  scope :related, ->(category, post=nil, limit=nil) do
    Rails.cache.fetch [collection_cache_key, category, post, :related, limit] do
      if post
        where.not(id: post.id).where(category: category).limit(limit).load
      else
        where(category: category).limit(limit).load
      end
    end
  end
  scope :matches_all_categories, ->(category) do
    Rails.cache.fetch [collection_cache_key, category, :matches_all_categories] do
      condition = category.down_roots.map { |c| "category_id = #{c.id}" }.join(' OR ')
      where(condition).to_a
    end
  end

  validates_presence_of :title, :published_at, :body, :category, :slug
  validates_uniqueness_of :slug

  belongs_to :category, touch: true

  before_validation :assign_slug, on: :create

  def to_param
    return unless self.id
    "#{self.created_at.strftime('%Y/%b/%d').downcase}/#{self.slug}"
  end

  def to_path_params
    {
      year: self.created_at.year,
      month: self.created_at.strftime('%b').downcase,
      day: self.created_at.day,
      id: self.slug
    }
  end

  def self.collection_cache_key
    count, max_updated_at = Post.unscoped.pluck('COUNT(*)', 'MAX("posts"."updated_at")').flatten
    "posts/all-#{count}-#{max_updated_at.try(:to_datetime).try(:to_i)}"
  end

  def self.cached_find_by_slug(slug)
    Rails.cache.fetch [name, slug] do
      includes(:category).find_by(slug: slug)
    end
  end

  private
    def check_vacancy
      return if self.is_vacancy
      self.category.up_tree.each do |category|
        if category.slug == 'vacancies'
          self.is_vacancy = true and return
        end
      end
    end

    def assign_slug
      return unless self.title
      return if self.slug && slug_is_not_used?

      self.slug ||= self.title.parameterize

      unless slug_is_not_used?
        self.slug = "#{SecureRandom.hex(2)}-#{self.slug}"
      end
    end

    def slug_is_not_used?
      ! Post.find_by(slug: self.slug)
    end
end
