Rails.application.routes.draw do
  root to: "top#index"

  get "/events", to: "events#index"
end
