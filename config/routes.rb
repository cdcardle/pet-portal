Rails.application.routes.draw do
  devise_for :users
  
  get '/home', to: "static#home"

  root "static#home"

  resources :users
  resources :pets
  resources :appointments
  resources :doctors
  resources :invoices
end
