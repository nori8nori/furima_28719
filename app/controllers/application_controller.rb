class ApplicationController < ActionController::Base

  before_action :basic_auth

  before_action :configure_permitted_parameters, if: :devise_controller?
  

  private

  #ユーザーの名前/誕生日をDBに保存出来る様に設定
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,keys: [:nickname, :lastname, :firstname, :lastname_kana, :firstname_kana, :birsday ])
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end
end