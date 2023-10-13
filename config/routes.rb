Rails.application.routes.draw do
  get 'home/index'
  devise_for :users

  resources :listings
  resources :bookings


  get 'users/:id', to: 'users#show', as: 'user'
  post 'users', to: 'users#create'
  root to: "home#index"
end
