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
      redirect_to post_path(@post),notice: "成功"

    else
      render :new
    end
  end
  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
  end


  def edit
    @post = current_user.posts.find(params[:id])
  end

  def update
    @post = current_user.posts.find(params[:id])
    @post.update_attributes(post_params)
    @post.image_data_uri = @post.dataURI
    if @post.update_attributes(update_post_params)
      flash[:notice] = "記事を編集しました。"
      redirect_to post_path(@post)
    else
      render :edit
    end
  end
  def destroy
    @post = current_user.posts.find(params[:id])

    @post.destroy
    redirect_to posts_path
  end


  private
  def post_params
    params.require(:post).permit(:name,:description,:image,:dataURI)
  end
  def update_post_params
    params.require(:post).permit(:image)
  end
  def correct_user
    @post = Post.find(params[:id])
    unless current_user.id == @post.user_id
      flash[:notice] = "権限がありません"
      redirect_to root_path
    end
  end
end
