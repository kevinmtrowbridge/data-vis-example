class Dataset < ActiveRecord::Base
  has_many :workspaces

  belongs_to :data_source
  belongs_to :hdfs_data_source
end
