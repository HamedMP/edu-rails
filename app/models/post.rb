class Post < ActiveRecord::Base
  before_save :check_vacancy

  default_scope  { order published_at: :desc }
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
