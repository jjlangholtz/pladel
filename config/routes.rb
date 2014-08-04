Rails.application.routes.draw do
  root to: 'welcome#index'

  get '/about', to: 'welcome#about'
  get '/team', to: 'welcome#team'

  resources :dashboard, only: :index
end
