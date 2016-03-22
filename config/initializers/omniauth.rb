Rails.application.config.middleware.use OmniAuth::Builder do
	provider :facebook, "1778754202345754", "172ab9d9a281308dca7b7794b28b13b5"
  provider :google_oauth2, "726222497246-6orbq8fq3rqml2b2q3kvrdpea2htm0ii.apps.googleusercontent.com", "f3i7EDaFfwoObrxFrgWeG5JE",
  { scope: 'userinfo.email,userinfo.profile,https://www.google.com/m8/feeds', access_type: 'offline', approval_prompt: '', client_options: {:ssl => {:ca_file => '/usr/lib/ssl/certs/ca-certificates.crt'}} }
  provider :twitter, "M5u41MZ1RCF9CX1stwIvfe1hD", "XJJncoHwffvQsdEfScObLlBDZ0GX93KlL4uiuXirjZIQkiEXOq"
end 