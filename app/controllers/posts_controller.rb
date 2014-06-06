class PostsController < ApplicationController
  # GET /posts/home
  # GET /posts/home.json
  def home
    @posts = Post.ordinary(9)
    @featured = Post.featured(4)
    @vacancies = Post.non_featured_vacancies(9)
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.cached_find_by_slug(params[:id])
    @related = Post.related(@post.category, @post, 4)
    @random_categories = Category.random(@post.category, 5)
  end

  # GET /categories/1
  # GET /categories/1.json
  def index
    @category = Category.cached_find_by_slug(params[:category_id])
    @related = Post.related(@category, nil, 2)
    @random_categories = Category.random(@category, 5)

    @posts = Kaminari.paginate_array(Post.matches_all_categories(@category)).page(params[:page])
  end
end
