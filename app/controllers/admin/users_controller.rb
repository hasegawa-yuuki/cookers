class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @users = User.all
    @users = @users.where('name LIKE(?)', "%#{params[:keyword]}%").or(@users.where('email LIKE(?)', "%#{params[:keyword]}%")) if params[:keyword].present?
  end
  
  def destroy
    @user = User.find_by_id(params[:id])
    @user.destroy if @user
    flash[:notice] = "success"
    redirect_to admin_users_path
  end
end
