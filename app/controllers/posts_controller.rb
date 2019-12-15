class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:edit,:update,:destroy]
  def new
    @post = Post.new
  end
  def create
    @post = Post.new(post_params.merge(user_id: current_user.id))
    @post.image_data_uri = @post.dataURI
    if @post.save
      redirect_to post_path(@post)
    else
      render :new
    end
  end
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end


  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      redirect_to post_path(@post)
    else
      render :edit
    end
  end
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end


  private
  def post_params
    params.require(:post).permit(:name,:description,:image,:dataURI)
  end

  def correct_user
    @post = Post.find(params[:id])
    unless current_user.id == @post.user_id
      flash[:notice] = "権限がありません"
      redirect_to root_path
    end
  end
end
