Rails.application.routes.draw do
  root to: 'welcome#index'

  get '/about', to: 'welcome#about'
  get '/team', to: 'welcome#team'

  resources :users, controller: 'users', only: [:new, :create, :update]
  resources :dashboard, only: :index
  resources :foods, only: [:new, :create]
  resources :devices, only: [:new, :create]
end
