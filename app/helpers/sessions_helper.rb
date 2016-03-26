module SessionsHelper
  def set_session(auth_param)
    session[:user_id] = auth_param[:uid]
  end
end
