Rails.application.routes.draw do
  root to: 'welcome#index'

  get '/about', to: 'welcome#about'
  get '/team', to: 'welcome#team'

  resources :users, controller: 'users', only: [:new, :create]
  resources :dashboard, only: :index
  resources :food_preferences, only: [:new, :create]
  resources :devices, only: [:new, :create]
end
