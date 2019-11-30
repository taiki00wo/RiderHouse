Rails.application.routes.draw do
  root to: 'riderhouses#index'

  #user
  devise_for :users
  resources :users

  #riderhouse
  resources :riderhouses do

    member do
      get :show_map
    end

    collection do
      get :index_map
    end
  end
  post '/homes/guest_sign_in', to: 'homes#guest_sign_in'

  # post
  resources :riderhouse do
    resources :posts
  end

  #message
  resources :user do
    resources :messages, only: [:index, :new, :create, :show]
  end

  # favorite
  resources :riderhouse do
    resources :favorites, only: [:create]
  end
  resources :favorites, only: [:index, :destroy]
end
