Rails.application.routes.draw do
  root to: 'riderhouses#index'
  devise_for :users
  resources :riderhouses
  resources :users

  # post
  resources :riderhouse do
    resources :posts
  end

  # favorite
  resources :riderhouse do
    resources :favorites, only: [:create]
  end
  resources :favorites, only: [:index, :destroy]
end
