# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def twitter
    callback_from :twitter
  end

  private
    def callback_from(provider)
      provider = provider.to_s

      @user = User.from_omniauth(request.env["omniauth.auth"])

      if @user.persisted?
        flash[:notice] = "ログインしました。"
        sign_in_and_redirect @user, event: :authentication
      else
        redirect_to new_user_registration_path, alert: "ユーザー認証に失敗しました。"
      end
    end
end