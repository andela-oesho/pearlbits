Rails.application.routes.draw do
  root 'page#index'

  get "/login_page", to: "page#login_page"
  get "/login", to: "sessions#new"
  get "logout", to: "sessions#destroy"
  get "/auth/:provider/callback", to: "sessions#create"
  get "/links/:id", to: "links#show"
  get "/links/:id/edit", to: "links#edit"
  post "/links/:id/edit", to:  "links#update"
  get "links/:id/delete", to: "links#delete"

  get "/dashboard", to:   "page#dashboard"
  get "/registration_form", to: "page#registration_form"
  get "/:short_url", to: "links#handle_short_url"
  post "/new/link", to: "links#create_url"
end
