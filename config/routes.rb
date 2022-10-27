Rails.application.routes.draw do
  resources :user_favorite_players
  devise_for :users
  resources :teams
  resources :notifications
  resources :players
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
