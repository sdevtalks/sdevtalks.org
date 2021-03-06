Rails.application.routes.draw do
  root to: "top#index"

  get "/events", to: "events#index"
  get "/events/:slug", to: "events#show", as: "event"

  get "/sitemap", to: "sitemaps#index"

  #
  # Admin
  #

  namespace :admin do
    root to: "top#index"
  end

  #
  # Administrate
  #

  namespace :database do
    root to: "events#index"

    resources :events
    resources :talks
    resources :venues
  end
end
