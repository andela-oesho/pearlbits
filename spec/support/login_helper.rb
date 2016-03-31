require "omniauth"
require "omniauth-facebook"
require "omniauth-twitter"
module LoginHelper
  def login(provider)
    # setup(provider)
    OmniAuth.config.test_mode = true
     # request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:facebook]
     old_controller = @controller
     @controller = SessionsController.new
     # get :create, provider: provider.to_s
     session[:user_id] = 1234
     @controller = old_controller
  end
  # def setup(provider)
  #   OmniAuth.config.add_mock(
  #    provider,
  #    uid: "12345",
  #    nickname: "sname",
  #    info: {
  #      first_name: "Olumuyiwa",
  #      last_name:  "Osiname",
  #      email:      "olumuyiwa.osiname@gmail.com"
  #    },
  #    credentials: { token: "123456789", expires_at: Time.now + 1.week, secret: "mysecret" },
  #    extra: {
  #      raw_info: { gender: "male" }
  #    }
  #  )

  # end
end
