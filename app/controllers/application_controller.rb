class ApplicationController < ActionController::Base
  include Pundit
  
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    user_path(current_user)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:username,:email,:password,:password_confirmation)}
    devise_parameter_sanitizer.for(:sign_in) {|u| u.permit(:username,:password)}
    devise_parameter_sanitizer.for(:account_update) {|u| u.permit(:username,:password,:password_confirmation,:current_password,:email)}
  end
end
