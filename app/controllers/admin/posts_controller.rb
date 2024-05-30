class Admin::PostsController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @posts = Post.all
    @posts = @posts.where('title LIKE(?)', "%#{params[:keyword]}%").or(@posts.where('body LIKE(?)', "%#{params[:keyword]}%")) if params[:keyword].present?
  end
  
  def destroy
    @post = Post.find_by_id(params[:id])
    @post.destroy if @post
    flash[:notice] = "success"
    redirect_to admin_posts_path
  end
end
