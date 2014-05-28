class Category < ActiveRecord::Base
  default_scope { order(:order) }

  validates :title, presence: true
  validates :slug, presence: true, uniqueness: true

  has_many :children, class_name: 'Category',
                      foreign_key: 'category_id',
                      dependent: :destroy

  belongs_to :parent, class_name: 'Category',
                      foreign_key: 'category_id'

  def to_param
    slug
  end
end
