Rails.application.routes.draw do
  root to: 'welcome#index'

  get '/about', to: 'welcome#about'
  get '/team', to: 'welcome#team'

  resource :dashboard, only: :show

  resources :users, controller: 'users', only: [:new, :create, :edit, :update]
  resources :foods, only: [:new, :create]
  resources :devices, only: :new
  resources :meals, only: [:create, :update]
  resources :sessions, only: :index
end
