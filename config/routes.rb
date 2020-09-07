Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
    
  resources :items
  resources :oders, only: [:index, :create]
end
