class HdfsDataSource < ActiveRecord::Base
  has_many :workspace_data_sources, :as => :polymorphic_data_source
  has_many :workspaces, :through => :workspace_data_sources
  has_many :hdfs_data_source_connection_parameters_sets

  def self.accessible_to(options)
    user = options[:user]
    workspace = options[:workspace]

    # if workspace
    #   DataSourceAccount.where(:workspace => workspace)
    # elsif user
    #   DataSourceAccount.where(:user => user)
    # else
      []
    # end
  end

  def accessible_to?(options)
    DataSource.accessible_to(options).any?
  end

  def explain_accessible_to?(options)

  end
end