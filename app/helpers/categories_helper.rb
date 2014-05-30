module CategoriesHelper
  def category_path(category)
    category_posts_path(category)
  end

  def category_url(category)
    category_posts_url(category)
  end
end
