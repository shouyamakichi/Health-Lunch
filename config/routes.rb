Rails.application.routes.draw do
  
  devise_for :users, controllers: {
   omniauth_callbacks: 'users/omniauth_callbacks',
   registrations: 'users/registrations'
 }

  resources :users, only: :new

  namespace :admin do
    resources :user_sessions, only: :new 
  end
  root to: 'items#index'

  resources :items, only: [:index, :show] do
    resources :reviews, only: [:index, :create]
  end
  
  resources :proteins do
    resources :buyers, only: [:index, :create]
  end

  resources :softs do
    resources :shohins, only: [:index, :create]
  end

  resources :calos do
    resources :bentos, only: [:index, :create]
  end

end
 