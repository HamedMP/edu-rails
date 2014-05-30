module PostsHelper
  def post_path(post)
    category_post_path(post.category, post)
  end

  def post_url(post)
    category_post_url(post.category, post)
  end
end
