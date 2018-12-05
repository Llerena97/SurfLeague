Rails.application.routes.draw do
  resources :tournaments
  resources :categories
  resources :participants
  resources :groups

  root 'tournaments#index'
end