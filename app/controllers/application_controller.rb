class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def authenticate_user
    @current_user ||= User.find_by(uid: session[:user_id])
    redirect_to root_path unless @current_user
  end
end
