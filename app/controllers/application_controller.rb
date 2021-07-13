class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :uid, :provider])
    devise_parameter_sanitizer.permit(:account_update, keys: [:last_name, :first_name, :profile])
  end

  def only_user
    return if user_signed_in?

    flash[:danger] = 'ログインが必要です'
    redirect_to new_user_registration_path
  end

  
end
