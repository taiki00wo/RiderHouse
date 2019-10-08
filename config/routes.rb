Rails.application.routes.draw do
  root to: 'riderhouses#index'
  resources :riderhouses
  resources :users
end
