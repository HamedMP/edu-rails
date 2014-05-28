class Category < ActiveRecord::Base
  default_scope { order(:order) }
  scope :root, -> { where(parent: nil) }

  validates :title, presence: true
  validates :slug, presence: true, uniqueness: true

  has_many :children, class_name: 'Category',
                      foreign_key: 'category_id',
                      dependent: :destroy

  belongs_to :parent, class_name: 'Category',
                      foreign_key: 'category_id'

  has_many :posts, dependent: :destroy

  def tree
    ancestor_list = [self]
    current_category = self
    while current_category.parent
      current_category = current_category.parent
      ancestor_list << current_category
    end
    ancestor_list.reverse
  end
end
