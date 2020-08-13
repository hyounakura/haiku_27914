Rails.application.routes.draw do
  devise_for :users
  root "haikus#index"
  resources :haikus, only: [:index, :new, :create]
end
