Rails.application.routes.draw do
  root to: 'riderhouses#index'

  #user
  devise_for :users
  resources :users

  #riderhouse
  get '/riderhouses/index_map', to: 'riderhouses#index_map'
  resources :riderhouses
  
  #home
  post '/homes/guest_sign_in', to: 'homes#guest_sign_in'

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
