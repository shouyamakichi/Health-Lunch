Rails.application.routes.draw do
  
  devise_for :users
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

  resources :calories, only: [:index, :new, :create]
  resources :softs, only: :index
end
 