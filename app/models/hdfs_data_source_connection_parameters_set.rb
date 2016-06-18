# == Schema Information
#
# Table name: hdfs_data_source_connection_parameters_sets
#
#  id                    :integer          not null, primary key
#  connection_parameters :string
#  hdfs_data_source_id   :integer
#  user_id               :integer
#  workspace_id          :integer
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#

class HdfsDataSourceConnectionParametersSet < ActiveRecord::Base
  belongs_to :hdfs_data_source
  belongs_to :user
  belongs_to :workspace
end
