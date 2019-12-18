require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  before do
    @user = FactoryBot.create(:lily)
  end
  describe "#index" do
    it "登録ユーザー表示" do
      sign_in @user
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "#show" do
    context "ログイン時" do
      it "ユーザー詳細" do
        sign_in @user
        get :show, params: {id: @user.id}
        expect(response).to have_http_status(:success)
      end
    end
    context "非ログイン時" do
      it "ログインページにリダイレクトされる" do
        get :show, params: {id: @user.id}
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

end
