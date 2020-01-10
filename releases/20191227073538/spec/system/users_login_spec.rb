require 'rails_helper'


describe "ユーザーログイン機能", type: :system, js: true do

    before do
        @user = FactoryBot.create(:lily)
        visit new_user_session_path
    end
    context "有効な情報を送信したとき" do
        it "トップページにリダイレクトされる" do
            fill_in "メールアドレス", with: @user.email
            fill_in "パスワード", with: @user.password
            click_button "ログイン"
            expect(page).to have_content "ログインしました。"
            expect(current_path).to eq root_path
        end
    end
    context "無効な情報を送信したとき" do
        it "エラーメッセージが出る" do
            fill_in "メールアドレス", with: ""
            fill_in "パスワード", with: ""
            click_button "ログイン"
            expect(page).to have_content "メールアドレスまたはパスワードが違います。"

        end
    end
end