Rails.application.routes.draw do
  resources :tournaments
  resources :categories
  resources :participants

  root 'tournaments#index'
end
