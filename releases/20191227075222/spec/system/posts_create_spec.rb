require 'rails_helper'

describe "描画投稿機能", type: :system, js: true do
    before do
        @user = FactoryBot.create(:lily)
        sign_in @user
        visit new_post_path
    end
    context "有効な情報を送信" do
        it "描画詳細画面にリダイレクトされる" do

            expect{
                fill_in "post_name",with: "test"
                fill_in "post_description",with: "test"
                click_button "投稿"
            }.to change(@user.posts,:count).by(1)
        end
    end
    context "無効な情報を送信" do
        it "失敗" do

            expect{
              fill_in "post_name",with: ""
              fill_in "post_description",with: ""
                click_button "投稿"
            }.to change(@user.posts,:count).by(0)
        end
    end
end