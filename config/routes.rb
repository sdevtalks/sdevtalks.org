Rails.application.routes.draw do
  root to: "top#index"

  get "/events", to: "events#index"
  get "/events/:slug", to: "events#show", as: "event"

  #
  # Admin
  #

  unless Rails.env.production?
    namespace :admin do
      root to: "top#index"
    end
  end
end
