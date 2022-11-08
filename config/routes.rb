Rails.application.routes.draw do
  devise_for :users
  root "articles#index"

  resources :articles
  resources :users, only: [:show, :index]
  resources :messages, only: [:index, :create, :show, :edit, :update]
  resources :subscribtions, only: [:create, :destroy]
end
