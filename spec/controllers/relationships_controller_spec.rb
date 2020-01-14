require 'rails_helper'

RSpec.describe RelationshipsController, type: :controller do
  before do
    @user = FactoryBot.create(:lily)
    @other_user = FactoryBot.create(:bob)
    # @post = FactoryBot.create(:post, user: @user)
  end
  describe "#create" do
    it "フォローする" do
      sign_in @user
      expect{
        post :create,params: { followed_id: @other_user.id }, xhr: true
      }.to change(Relationship, :count).by(1)
    end
  end

  describe "#destroy" do
    it "フォローを外す" do
      sign_in @user
      @relationship = FactoryBot.create(:relationship, followed_id: @other_user.id, follower_id: @user.id)

      expect{
        # delete :destroy,params: {followed_id: @other_user.id,follower_id: @user.id,id:@relationship.id}, xhr: true
        delete :destroy,params: {id: @relationship.id}, xhr: true
      }.to change(Relationship, :count).by(-1)
    end
  end
end