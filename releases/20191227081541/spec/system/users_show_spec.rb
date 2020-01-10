require 'rails_helper'
describe "プロフィール画面からの遷移", type: :system, js: true do
  before do
    @user = FactoryBot.create(:lily)
    sign_in @user
    visit user_path(@user)
  end
  context "画面遷移" do
    it " プロフィールを編集するを押す" do
      click_link "プロフィールを編集する"
      expect(current_path).to eq edit_user_registration_path
    end
    it "followingを押す" do
      find("#following").click
      expect(current_path).to eq following_user_path(@user)
    end
    it "followersを押す" do
      find("#followers").click
      expect(current_path).to eq followers_user_path(@user)
    end
  end
end