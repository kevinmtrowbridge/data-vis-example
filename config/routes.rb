Rails.application.routes.draw do
  root :to => 'dashboard#index'
  resources :data_source_accounts
  resources :data_sources
  resources :workspaces
  resources :users
end
