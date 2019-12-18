require 'rails_helper'

RSpec.describe PagesController, type: :controller do

  describe "GET #home" do
    it "ホーム画面が表示される" do
      get :home
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #about" do
    it "about画面が表示される" do
      get :about
      expect(response).to have_http_status(:success)
    end
  end

end
