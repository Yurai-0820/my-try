Rails.application.routes.draw do
  devise_for :users
  root to: 'maxes#index'
  resources :users
  resources :manners
  resources :trainings do
  resources :maxes, only:[:index, :create]
end
end
