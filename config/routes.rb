Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'
  resources :riderhouses
  resources :users
end
