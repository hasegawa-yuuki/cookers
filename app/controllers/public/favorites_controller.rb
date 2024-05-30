class Public::FavoritesController < ApplicationController
  before_action :authenticate_user!
  def create
    post = Post.find(params[:post_id])
    current_user.favorite(post)
    flash[:notice] = "お気に入りしました。" 
    redirect_back(fallback_location: root_url)
  end
  
  def destroy
    post = Post.find(params[:post_id])
    current_user.unfavorite(post)
    flash[:notice] = "お気に入りを解除しました。" 
    redirect_back(fallback_location: root_url)
  end
end
