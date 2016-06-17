class HdfsDataSourceConnectionParametersSet < ActiveRecord::Base
  belongs_to :hdfs_data_source
  belongs_to :user
  belongs_to :workspace
end