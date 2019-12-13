Rails.application.routes.draw do

  resources :posts
  devise_for :users
  root 'pages#home'
  get 'pages/about' , to: 'pages#about'
end
