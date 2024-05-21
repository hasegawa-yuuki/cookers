class Public::PostsController < ApplicationController
  before_action :authenticate_user!, only: %i(new create edit update destroy)
  before_action :correct_user, only: %i(edit update destroy)
  
  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:notice] = "success"
      redirect_to post_path(@post)
    else
      flash.now[:alert] = "failed"
      render :new
    end
  end
  
  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = "success"
      redirect_to post_path(@post)
    else
      flash.now[:alert] = "failed"
      render :edit
    end
  end
  
  def destroy
    @post = Post.find_by_id(params[:id])
    @post.destroy if @post
    flash[:notice] = "success"
    redirect_to root_path
  end
  
  private
  
  def post_params
    params.require(:post).permit(:title, :category_id, :body, :image)
  end
  
  def correct_user
    @post = current_user.posts.find_by_id(params[:id])
    redirect_to root_url if !@post
  end
end
