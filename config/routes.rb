Rails.application.routes.draw do
  root 'page#index'

  get "/login_page", to: "page#login_page"
  get "/login", to: "sessions#new"
  get "/auth/:provider/callback", to: "sessions#create"
  
 
  get "/dashboard", to:   "page#dashboard"
  get "/registration_form", to: "page#registration_form"
  get "/:short_url", to: "link#handle_short_url"
  post "/new/link", to: "link#create_url"

end
