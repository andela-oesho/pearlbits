Rails.application.routes.draw do
  root 'page#index'

  get "/login_page", to: "page#login_page"
  
 
  get "/dashboard", to:   "page#dashboard"
  get "/registration_form", to: "page#registration_form"
  get "/:short_url" => "link#handle_short_url"
   post "/new/link" => "link#create_url"
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }


end
