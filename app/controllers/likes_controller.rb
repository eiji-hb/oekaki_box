class LikesController < ApplicationController
  before_action :set_post, only: [:create, :destroy]
  def create
    @like = current_user.likes.create(like_params)

    respond_to do |format|
      format.html { redirect_to @post }
      format.js
    end
  end

  def destroy
    @like = Like.find_by(like_params, user_id: current_user.id)
    @like.destroy
    respond_to do |format|
      format.html { redirect_to @post }
      format.js
    end
  end

  private
  def set_post
    @post = Post.find(params[:post_id])
  end
  def like_params
    params.permit(:post_id)
  end
end
