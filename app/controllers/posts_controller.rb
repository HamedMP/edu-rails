class PostsController < ApplicationController
  # GET /posts/home
  # GET /posts/home.json
  def home
    @posts = Post.ordinary.limit(9)
    @featured = Post.featured.limit(4)
    @vacancies = Post.non_featured_vacancies.limit(9)
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find_by(slug: params[:id])
    @related = Post.where.not(id: @post.id).where(category: @post.category).limit(4)
    @random_categories = Category.order("RANDOM()").where.not(id: @post.category.id).limit(5)
  end

  # GET /categories/1
  # GET /categories/1.json
  def index
    @category = Category.find_by(slug: params[:category_id])
    @related = Post.order("RANDOM()").limit(2)
    @random_categories = Category.order("RANDOM()").limit(5)

    matches_all_categories = @category.down_roots.map { |c| "category_id = #{c.id}" }.join(' OR ')
    @posts = Post.where(matches_all_categories).page(params[:page])
  end
end
