class Dataset < ActiveRecord::Base
  has_many :workspace_datasets
  has_many :workspaces, :through => :workspace_datasets

  belongs_to :data_source
  belongs_to :hdfs_data_source
end
