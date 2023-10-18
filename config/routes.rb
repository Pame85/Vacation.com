Rails.application.routes.draw do
  get 'home/index'
  devise_for :users

  resources :listings do
    resources :bookings, only: [:new, :create]
  end
  
  get 'users/:id', to: 'users#show', as: 'user'
  post 'users', to: 'users#create'
  root to: "home#index"
end
