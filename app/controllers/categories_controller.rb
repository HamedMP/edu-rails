class CategoriesController < ApplicationController
  # GET /categories/1
  # GET /categories/1.json
  def show
    @category = Category.find(params[:id])
    @related = Post.order("RANDOM()").limit(2)
    @random_categories = Category.order("RANDOM()").limit(5)
    @posts = @category.posts.page(params[:page])
  end
end
