# == Schema Information
#
# Table name: workspace_datasets
#
#  id           :integer          not null, primary key
#  dataset_id   :integer
#  workspace_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class WorkspaceDataset < ActiveRecord::Base
  belongs_to :dataset
  belongs_to :workspace
end
