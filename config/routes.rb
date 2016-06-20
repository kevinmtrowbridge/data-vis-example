Rails.application.routes.draw do
  resources :workspace_data_sources
  root :to => 'dashboard#index'

  resources :datasets
  resources :workspace_datasets
  resources :hdfs_data_sources
  resources :hdfs_data_source_connection_parameters_sets
  resources :data_source_accounts
  resources :data_sources

  resources :workspaces do
    resources :data_sources, :only => [:index, :show], :controller => :workspace_data_sources_api, :as => :api_data_source do
      resource :data_source_account, :only => [:show], :controller => :workspace_data_source_accounts_api
    end
    resources :hdfs_data_sources, :only => [:index, :show], :controller => :workspace_hdfs_data_sources
  end

  resources :workspace_data_sources
  resources :users
end
