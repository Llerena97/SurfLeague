Rails.application.routes.draw do
  resources :tournaments
  resources :categories
  root 'tournaments#index'
end
