Rails.application.routes.draw do
  devise_for :users
  root to: 'users#index'
  resources :users
  resources :manners
  resources :limits
  resources :memos
  resources :trainings do
    resources :maxes
  end
end
