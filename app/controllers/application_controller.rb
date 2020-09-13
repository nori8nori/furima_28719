class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :configure_permitted_parameters, if: :devise_controller?

  # プライベートメソッド
  private

  # ユーザーの名前/誕生日をDBに保存出来る様に設定（ストロングパラメーター）/usersコントローラーがないから
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(
      :sign_up, keys: [:nickname, :birthday, :firstname, :lastname, :firstname_kana, :lastname_kana]
    )
  end

  # Basic認証コード
  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['BASIC_AUTH_USER'] && password == ENV['BASIC_AUTH_PASSWORD']
    end
  end
end
