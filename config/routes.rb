Rails.application.routes.draw do
  devise_for :users
  resources :users, except: [:show], path: :judges
  resources :tournaments do
    resources :groups, only: [:new, :create] do
      resources :scores, except: [:index, :show, :destroy]
    end
  end
  resources :categories
  resources :participants

  root 'tournaments#index'
end