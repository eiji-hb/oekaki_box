require 'rails_helper'
describe "フォロー機能", type: :system do
  before do

    @user = FactoryBot.create(:lily)
    @other_user = FactoryBot.create(:bob)
    sign_in @user
    visit user_path(@other_user)
  end
  context "まだ「フォロー」していない場合" do
    it "「フォロー」できること" do
      expect {
        click_button "フォローする"
      }.to change(Relationship, :count).by(1)
      expect(page).to have_button '解除する'
    end
  end
  context "「フォロー済」の場合" do
    before do
      click_button "フォローする"
    end
    it "「フォロー」解除" do
      expect {
        click_button "解除する"
      }.to change(Relationship, :count).by(-1)
      expect(page).to have_button 'フォローする'
    end
  end
end