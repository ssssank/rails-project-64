# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root 'posts#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :posts do
    scope module: :posts do
      resources :comments, only: %i[create]
      resources :likes, only: %i[create destroy]
    end
  end
  resources :categoris
  # Defines the root path route ("/")
  # root "articles#index"
end
