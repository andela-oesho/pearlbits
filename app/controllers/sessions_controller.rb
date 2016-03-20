class SessionsController < ApplicationController
  def new
  end

  def create
  	User.from_omniauth(env["omniauth.auth"])
  	redirect_to dashboard_path
  end
end