require 'rails_helper'


describe "新規ユーザー登録", type: :system, js: true do
    before do
        visit new_user_registration_path
    end

    context "有効な情報を送信したとき" do
        it "トップページにリダイレクトされる" do
            fill_in "user_username", with: "testname"
            fill_in "user_email", with: "testemail@example.com"
            fill_in "user_password", with: "password"
            fill_in "user_password_confirmation", with: "password"
            click_button "登録"
            expect(page).to have_content "アカウント登録が完了しました。"
            expect(current_path).to eq root_path
        end
    end
    context "無効な情報を送信したとき" do
        it "エラーメッセージが出る" do
            fill_in "user_username", with: ""
            fill_in "user_email", with: ""
            fill_in "user_password", with: ""
            fill_in "user_password_confirmation", with: ""
            click_button "登録"
            expect(page).to have_css('#error_explanation')
        end
    end

end