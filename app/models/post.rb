class Post < ActiveRecord::Base
  before_save :check_vacancy

  default_scope                     { order(published_at: :desc) }
  scope :non_featured_vacancies, -> { where(is_vacancy: true, is_featured: false) }
  scope :featured, ->               { where(is_featured: true) }
  scope :ordinary, ->               { where(is_featured: false, is_vacancy: false) }

  validates_presence_of :title, :published_at, :body, :category, :slug
  validates_uniqueness_of :slug

  belongs_to :category

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
