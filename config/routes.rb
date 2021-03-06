# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_scope :user do
    authenticated :user do
      root 'posts#index', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/registrations#new', as: :unauthenticated_root
    end
  end
  resources :posts
  resources :users, only: %i[show index]
  resources :users do
    get "/addfriend", :to => "users#addfriend", :as => "addfriend"
    get '/friends', to: 'users#friends'
    get "/friend_requests", :to => "users#friend_requests", :as => "friend_requests"
    get "/acceptfriend", :to => "users#acceptfriend", :as => "acceptfriend"
    get "/declinefriend", :to => "users#declinefriend", :as => "declinefriend"
  end
end
