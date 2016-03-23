Rails.application.config.middleware.use OmniAuth::Builder do
	provider :facebook, ENV["FACEBOOK_APP_ID"], ENV["FACEBOOK_SECRET"],
           {:scope => 'email', :client_options => {:ssl => {:ca_file => '/usr/lib/ssl/certs/ca-certificates.crt'}}}

	provider :twitter, ENV["TWITTER_API_KEY"], ENV["TWITTER_SECRET"]
  provider :google_oauth2, ENV["GOOGLE_CLIENT_ID"], ENV["GOOGLE_CLIENT_SECRET"]
end 