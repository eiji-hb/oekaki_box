require 'rails_helper'


describe "ユーザーアカウント編集機能", type: :system, js: true do

    before do
        @user = FactoryBot.create(:lily)
        sign_in @user
        visit edit_user_registration_path
    end
    context "正しい情報を入力した時" do
        it "トップページにリダイレクトされる" do
            fill_in "user_username", with: @user.username
            fill_in "user_email", with: @user.email
            fill_in "user_password", with: "newpassword"
            fill_in "user_password_confirmation", with: "newpassword"

            fill_in "user_current_password", with: @user.password
            click_button "更新する"
            expect(page).to have_content "アカウント情報を変更しました。"
            expect(current_path).to eq root_path
        end
    end


    context "間違った情報を入力した時" do
        it "トップページにリダイレクトされる" do
            fill_in "user_username", with: ""
            fill_in "user_email", with: ""
            fill_in "user_password", with: ""
            fill_in "user_password_confirmation", with: ""

            fill_in "user_current_password", with: ""
            click_button "更新する"
            expect(page).to have_css('#error_explanation')
        end
    end
end