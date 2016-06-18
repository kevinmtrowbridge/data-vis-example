# == Schema Information
#
# Table name: hdfs_data_sources
#
#  id         :integer          not null, primary key
#  name       :string
#  public     :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class HdfsDataSource < ActiveRecord::Base
  has_many :workspace_data_sources, :as => :polymorphic_data_source
  has_many :workspaces, :through => :workspace_data_sources
  has_many :hdfs_data_source_connection_parameters_sets

  def self.accessible_to(options)
    user = options[:user]
    workspace = options[:workspace]

    ids = []
    if workspace
      ids = HdfsDataSourceConnectionParametersSet.where('workspace_id = ? OR user_id = ?', workspace, user).pluck(:hdfs_data_source_id)
    elsif user
      ids = HdfsDataSourceConnectionParametersSet.where(user_id = ?', workspace, user).pluck(&:hdfs_data_source_id)
    end

    HdfsDataSource.where("id IN (?) OR public = ?", ids, true)
  end

  def hdfs_data_source_connection_parameters_sets_for(options)
    user = options[:user]
    workspace = options[:workspace]

    if workspace
      return hdfs_data_source_connection_parameters_sets.where('workspace_id = ? OR user_id = ?', workspace, user).first
    elsif user
      return hdfs_data_source_connection_parameters_sets.where(:user => user).first
    end

    nil
  end

  def merge_connection_parameters_for(options)
    cp = hdfs_data_source_connection_parameters_sets_for(options)
    attributes.merge cp.attributes
  end

  def accessible_to?(options)
    HdfsDataSource.accessible_to(options).any?
  end

  def explain_accessible_to(options)
    user = options[:user]
    workspace = options[:workspace]

    if workspace && hdfs_data_source_connection_parameters_sets.where(:workspace => workspace).any?
      return 'this data source is a member of the workspace'
    elsif user && hdfs_data_source_connection_parameters_sets.where(:user => user).any?
      return 'this data source is accessible to your user NOTE THIS DOES NOT EXIST IN CHORUS AND NO PLANS TO BUILD'
    elsif public
      return 'this data source is public, accessible to all workspaces'
    end
  end
end
