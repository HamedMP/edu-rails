class PostsController < ApplicationController
  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.ordinary.limit(9)
    @featured = Post.featured.limit(4)
    @vacancies = Post.non_featured_vacancies.limit(9)
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])
    @related = Post.where.not(id: @post.id).where(category: @post.category).limit(4)
    @random_categories = Category.order("RANDOM()").where.not(id: @post.category.id).limit(5)
  end
end
