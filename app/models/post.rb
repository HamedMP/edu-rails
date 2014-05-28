class Post < ActiveRecord::Base
  before_save :check_vacancy

  default_scope                     { order(published_at: :desc) }
  scope :non_featured_vacancies, -> { where(is_vacancy: true, is_featured: false) }
  scope :featured, ->               { where(is_featured: true) }
  scope :ordinary, ->               { where(is_featured: false, is_vacancy: false) }

  validates_presence_of :title, :published_at, :body, :category

  belongs_to :category

  private
    def check_vacancy
      return if self.is_vacancy
      self.category.tree.each do |category|
        if category.slug == 'vacancies'
          self.is_vacancy = true and return
        end
      end
    end
end
