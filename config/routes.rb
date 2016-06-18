Rails.application.routes.draw do
  resources :hdfs_data_sources
  resources :hdfs_data_source_connection_parameters_sets
  root :to => 'dashboard#index'
  resources :data_source_accounts
  resources :data_sources
  resources :workspaces
  resources :users
end
