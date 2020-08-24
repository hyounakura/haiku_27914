Rails.application.routes.draw do
  devise_for :users
  root "haikus#index"
  resources :haikus, only: [:index, :new, :create, :show, :destroy]
  resources :users, only: [:index, :show]
  resources :favorites, only: [:index, :create, :destroy]
  resources :users do
    member do
     get :following, :followed
    end
  end
  resources :follows, only: [:index, :create, :destroy]
end
