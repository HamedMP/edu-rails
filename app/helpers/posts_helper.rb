module PostsHelper
  def post_path(post)
    category_post_path(post.category, post.to_path_params)
  end

  def post_url(post)
    category_post_url(post.category, post.to_path_params)
  end
end
