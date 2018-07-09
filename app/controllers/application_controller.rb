class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end

#  helper_method :current_user

#  def current_user
#    @user ||= User.find(session[:user_id]) if session[:user_id]
#  end

#  def authorize
#    unless current_user
#      flash[:alert] = "로그인을 해야 글을 쓸 수 있습니다."
#      redirect_to '/login'
#    end
#  end
end
