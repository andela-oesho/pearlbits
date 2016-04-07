class SessionsController < ApplicationController
  include SessionsHelper

  def new
  end

  def create
    if User.from_omniauth(env["omniauth.auth"])
      set_session(env["omniauth.auth"])
      redirect_to dashboard_path
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

  def set_session(auth_param)
    session[:user_id] = auth_param[:uid]
  end
end
