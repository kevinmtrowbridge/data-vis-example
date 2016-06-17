class User < ActiveRecord::Base
  has_many :data_source_accounts
  has_many :hdfs_data_source_connection_parameters_sets
end