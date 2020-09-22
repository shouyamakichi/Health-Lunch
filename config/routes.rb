Rails.application.routes.draw do
  devise_for :users
  namespace :admin do
    resources :user_sessions, only: :new 
  end
  root to: 'items#index'
  resources :items 
  resources :proteins, only: [:index, :new, :create, :show]
  resources :calories, only: [:index, :new, :create]
  resources :softs, only: :index
end
 