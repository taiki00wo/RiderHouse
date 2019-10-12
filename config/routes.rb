Rails.application.routes.draw do
  devise_for :users
  root to: 'riderhouses#index'
  resources :riderhouses
  resources :users
end
