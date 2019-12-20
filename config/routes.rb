Rails.application.routes.draw do
  devise_for :users
  get '/home', to: "static#home"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root "static#home"

  resources :appointments
end
