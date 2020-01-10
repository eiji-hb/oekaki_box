require 'rails_helper'
describe "home画面からの遷移", type: :system, js: true do

  context "非ログイン時の画面遷移" do
    before do
      visit root_path
    end
    it "新規登録に遷移" do
      click_link "始めてみよう！"
      expect(current_path).to eq new_user_registration_path
    end
    it "新規登録に遷移" do
      click_link "新規会員登録"
      expect(current_path).to eq new_user_registration_path
    end
    it "説明ページに遷移" do
      click_link "お絵かきBOXとは",match: :first
      expect(current_path).to eq pages_about_path
    end
    it "ログイン画面に遷移" do
      click_link "ログイン"
      expect(current_path).to eq new_user_session_path
    end
    it "top画面に遷移" do
      click_link "TOP"
      expect(current_path).to eq root_path
    end
  end
  context "ログイン時の画面遷移" do
    before do
    @user = FactoryBot.create(:lily)
    sign_in @user
    visit root_path
    end
    it "描画画面に遷移" do
      click_link "投稿しよう"
      expect(current_path).to eq new_post_path
    end
    it "投稿画面に遷移" do
      click_link "投稿する"
      expect(current_path).to eq new_post_path
    end
    it "投稿一覧画面に遷移" do
      click_link "投稿一覧"
      expect(current_path).to eq  posts_path
    end
    it "投稿一覧画面に遷移" do
      click_link "お絵かきBOX"
      expect(current_path).to eq  posts_path
    end
    it "プロフィール画面に遷移" do
      find(".dropdown-toggle").click
      click_link "プロフィール"
      expect(current_path).to eq  user_path(@user)
    end
    it "登録ユーザー一覧画面に遷移" do
      find(".dropdown-toggle").click
      click_link "登録ユーザー一覧"
      expect(current_path).to eq  users_path
    end
    it "ログアウトボタンを押す" do
      find(".dropdown-toggle").click
      click_link "ログアウト"
      expect(page).to have_content "ログアウトしました。"
    end
  end

end