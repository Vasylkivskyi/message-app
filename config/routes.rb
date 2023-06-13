Rails.application.routes.draw do
  root "chatroom#index"

  get "/login", to: "sessions#new"
  get "sessions/create"
end
