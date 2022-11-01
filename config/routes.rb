Rails.application.routes.draw do  

  root "pages#index"

  devise_for :users    

  namespace :supporter do    
    resources :players, only: %i[index show]
    resources :user_favorite_players, as: 'favorite_players', only: %i[index create destroy]
    resources :notifications, only: %i[index new create]
  end

  namespace :admin do    
    resources :players
    resources :teams
    resources :notifications
    resources :user_favorite_players, as: 'favorite_players'          
  end  

end
