class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  
  before_action :authenticate_user!
  before_action :basic_auth
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [ :nickname, :email, :encrypted_password, :family_name, :last_name, :j_family_name, :j_last_name, :birthday ])
  end
  
  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end
end