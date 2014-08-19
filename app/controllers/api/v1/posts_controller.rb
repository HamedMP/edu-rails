class API::V1::PostsController < ApplicationController
  respond_to :json

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])
    respond_with @post
  end

  # GET /posts/
  # GET /posts/.json
  def index
    @posts = Post.all
    respond_with @posts
  end
end
