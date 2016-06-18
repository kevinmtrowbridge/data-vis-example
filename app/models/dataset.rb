# == Schema Information
#
# Table name: datasets
#
#  id                  :integer          not null, primary key
#  name                :string
#  data_source_id      :integer
#  hdfs_data_source_id :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class Dataset < ActiveRecord::Base
  has_many :workspace_datasets
  has_many :workspaces, :through => :workspace_datasets

  belongs_to :data_source
  belongs_to :hdfs_data_source
end
