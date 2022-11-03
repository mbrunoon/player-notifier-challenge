Rails.application.routes.draw do  

  root "pages#index"

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  namespace :supporter do  
    root "pages#index"
    resources :players, only: %i[index show]
    resources :user_favorite_players, as: 'favorite_players', only: %i[index create destroy]
    resources :notifications, only: %i[index new create]
  end

  namespace :admin do  
    root "pages#index"  
    resources :players
    resources :notifications
    resources :teams    
    resources :user_favorite_players, as: 'favorite_players'   
    
    namespace :trigger do
      patch 'notification/:id', action: "notification", as: 'notification'
    end       

  end  

end
