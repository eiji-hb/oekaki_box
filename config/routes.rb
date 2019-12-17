Rails.application.routes.draw do

  resources :posts
  devise_for :users
  resources :users, only: [:show,:index] do
    member do
      get :following, :followers
    end
  end
  resources :relationships, only: [:create, :destroy]

  root 'pages#home'
  get 'pages/about' , to: 'pages#about'
end
