class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception
  rescue_from Exception, with: :server_error

...
  def server_error(e)
    ExceptionNotifier.notify_exception(e, :env => request.env, :data => {:message => "error"})
    respond_to do |format|
      format.html { render template: 'front/errors/500', layout: 'front/layouts/error', status: 500 }
      format.all { render nothing: true, status: 500 }
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :uid, :provider])
    devise_parameter_sanitizer.permit(:account_update, keys: [:last_name, :first_name, :profile])
  end
  

  def only_user
    return if user_signed_in?

    flash[:danger] = 'ログインが必要です'
    redirect_to new_user_session_path
  end

  
end
