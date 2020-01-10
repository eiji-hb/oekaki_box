require "rails_helper"

describe "twitter機能", type: :system do
  before do
    Rails.application.env_config["omniauth.auth"] = twitter_mock
    visit new_user_session_path
  end
  it "twitter連携でサインアップ成功" do
    expect{
      click_link "twitterでログイン"
    }.to change(User, :count).by(1)
    expect(page).to have_content "ログインしました。"
  end
end