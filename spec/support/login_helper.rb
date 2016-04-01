require "omniauth"
require "omniauth-facebook"
require "omniauth-twitter"
module LoginHelper
  def login
    OmniAuth.config.test_mode = true
    old_controller = @controller
    @controller = SessionsController.new
    session[:user_id] = 1234
    @controller = old_controller
  end
end
