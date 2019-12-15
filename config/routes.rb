Rails.application.routes.draw do

  resources :posts
  devise_for :users
  resources :users, only: [:show,:index]
  root 'pages#home'
  get 'pages/about' , to: 'pages#about'
end
