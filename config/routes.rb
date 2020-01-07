Rails.application.routes.draw do
  devise_for :users

  get "/signin", to: "sessions#new"
  post "/sessions/create", to: "sessions#create"
  delete "/signout", to: "sessions#destroy"
  
  get '/home', to: "static#home"

  root "static#home"

  resources :users
  resources :appointments
end
