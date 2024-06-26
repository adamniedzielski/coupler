# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  resources :friend_profiles do
    resources :matches, only: [:create]
  end
  resources :users, only: [:index] do
    resources :connection_requests, only: [:create]
  end
  resources :connection_requests, only: [] do
    resources :connections, only: [:create]
  end

  # Defines the root path route ("/")
  root "friend_profiles#index"
end
