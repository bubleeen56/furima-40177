class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == 'admin' && password == '2222'
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :email, :password, :password_confirmation, :first_name_kanji, :last_name_kanji, :first_name, :last_name, :birth])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :password])
  end
end
