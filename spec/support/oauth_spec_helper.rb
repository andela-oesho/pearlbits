require "omniauth"
require "omniauth-facebook"
require "omniauth-twitter"
require "faker"
module OauthSpecHelper
  def google_setup
   OmniAuth.config.add_mock(
     :google,
     uid: Faker::Address.zip_code,
     nickname: Faker::Internet.user_name,
     credentials: { token: token, expires_at: Time.now + 1.week, secret: "mysecret" },
     user_info: {
       name: Faker::Name.name
     }
   )
 end
end
