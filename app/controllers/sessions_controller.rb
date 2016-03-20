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
end
