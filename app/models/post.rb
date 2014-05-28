class Post < ActiveRecord::Base
  before_save :check_vacancy

  default_scope  { order published_at: :desc }
  validates_presence_of :title, :published_at, :body, :category

  belongs_to :category

  def ancestors
    ancestor_list = [self.category]
    current_category = self.category
    while current_category.parent
      current_category = current_category.parent
      ancestor_list << current_category
    end

    ancestor_list.reverse
  end

  private
    def check_vacancy
      return if self.is_vacancy
      self.ancestors.each do |ancestor|
        if ancestor.slug == 'vacancies'
          self.is_vacancy = true and return
        end
      end
    end
end
