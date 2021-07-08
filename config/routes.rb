Rails.application.routes.draw do
  root to: "top#index"

  resources :events, param: :slug, only: %i[index show] do
    resources :talks, only: %i[edit update]
  end

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
