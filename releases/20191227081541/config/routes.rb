Rails.application.routes.draw do

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    omniauth_callbacks: "users/omniauth_callbacks",
  }
  resources :posts do
    resources :likes, only: [:create, :destroy]
  end
  resources :users, only: [:show,:index] do
    member do
      get :following, :followers
    end
  end
  resources :relationships, only: [:create, :destroy]

  root 'pages#home'
  get 'pages/about' , to: 'pages#about'
end
