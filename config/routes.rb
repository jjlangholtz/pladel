Rails.application.routes.draw do
  root to: 'welcome#index'

  resources :dashboard, only: :index
end
