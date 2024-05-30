class Public::HomeController < ApplicationController
  def top
    @posts = Post.all.order(created_at: :desc)
    @posts = @posts.where('title LIKE(?)', "%#{params[:keyword]}%").or(@posts.where('body LIKE(?)', "%#{params[:keyword]}%")) if params[:keyword].present?
  end
end
