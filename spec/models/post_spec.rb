require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @post = FactoryBot.create(:post)
  end
  describe "投稿が有効なとき" do
    it "有効な投稿検証" do
      expect(@post).to be_valid
    end
  end
  describe "投稿が無効な場合" do
    context "nameが無効な場合" do
      it "nameが存在しないとき" do
        @post.name = nil
        expect(@post).not_to be_valid
      end
      it "nameが31文字以上の場合" do
        @post.name = "a" * 31
        expect(@post).not_to be_valid
      end
    end
  end
  context "descriptionが無効な場合" do
    it "descriptionが存在しないとき" do
      @post.description = nil
      expect(@post).not_to be_valid
    end
    it "descriptionが131文字以上の場合" do
      @post.description = "a" * 131
      expect(@post).not_to be_valid
    end
  end
end
