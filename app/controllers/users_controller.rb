class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @user_post = @user.posts.order(created_at: :desc)
  end
  def following
    @user = User.find(params[:id])
    @users = @user.following
    render 'show_follow'
  end
  def followers
    @user = User.find(params[:id])
    @users = @user.followers
    render 'show_follow'
  end
end
