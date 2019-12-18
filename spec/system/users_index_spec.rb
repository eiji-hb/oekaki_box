require 'rails_helper'
describe "index画面からの遷移", type: :system, js: true do
  before do
    @user = FactoryBot.create(:lily)
    @other_user = FactoryBot.create(:test)
    sign_in @user
  end
  context "他のユーザーページに遷移" do
    before do
    visit user_path(@other_user)
    end
    it "フォローボタンがある" do
      expect(page).to have_button("フォローする")
    end
    it "editボタンが無い" do
      expect(page).to have_no_link("edit")
    end
  end
end