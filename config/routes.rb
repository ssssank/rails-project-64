# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root 'pages#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :posts
  resources :categoris
  # Defines the root path route ("/")
  # root "articles#index"
end
