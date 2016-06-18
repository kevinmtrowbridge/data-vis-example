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

  has_many :workspace_datasets
  has_many :datasets, :through => :workspace_datasets
end
