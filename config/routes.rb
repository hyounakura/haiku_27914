Rails.application.routes.draw do
  devise_for :users
  root "haikus#index"
  resources :haikus, only: [:index, :new, :create, :show]
  resources :users, only: [:index, :show]
  resources :favorites, only: [:index, :create, :destroy]
end
