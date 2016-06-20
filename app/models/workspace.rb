# == Schema Information
#
# Table name: workspaces
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Workspace < ActiveRecord::Base
  has_many :workspace_data_sources
  has_many :data_sources, :through => :workspace_data_sources, :source => :polymorphic_data_source, :source_type => 'DataSource'
  has_many :hdfs_data_sources, :through => :workspace_data_sources, :source => :polymorphic_data_source, :source_type => 'HdfsDataSource'

  has_many :data_source_accounts
  has_many :hdfs_data_source_connection_parameter_sets

  has_many :workspace_datasets
  has_many :datasets, :through => :workspace_datasets

  def accessible_data_sources
    ids = self.data_sources.pluck(:id)
    public_ids = DataSource.where(:public => true).pluck(:id)
    DataSource.find(ids + public_ids)
  end

  def accessible_hdfs_data_sources
    ids = self.hdfs_data_sources.pluck(:id)
    public_ids = HdfsDataSource.where(:public => true).pluck(:id)
    HdfsDataSource.find(ids + public_ids)
  end
end