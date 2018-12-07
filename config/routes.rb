Rails.application.routes.draw do
  resources :tournaments do
    resources :groups, only: [:new, :create]
  end
  resources :categories
  resources :participants

  root 'tournaments#index'
end