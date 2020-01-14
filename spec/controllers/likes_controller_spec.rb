require 'rails_helper'

RSpec.describe LikesController, type: :controller do
  before do
    @user = FactoryBot.create(:lily)
    @post = FactoryBot.create(:post, user: @user)
  end
  describe "#create" do
    it "いいね作成" do
      sign_in @user
      expect{
        post :create,params: { post_id: @post.id}, xhr: true
      }.to change(@user.likes, :count).by(1)
    end
  end

  describe "#destroy" do
    it "いいね消去" do
      sign_in @user
      @like = FactoryBot.create(:like,user_id: @user.id,post_id: @post.id)
      expect{
        delete :destroy,params: {post_id: @post.id, user_id: @user.id, id: @like.id}, xhr: true
      }.to change(@user.likes, :count).by(-1)
    end
  end


end
