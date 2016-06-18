# == Schema Information
#
# Table name: workspace_data_sources
#
#  id                           :integer          not null, primary key
#  polymorphic_data_source_id   :integer
#  polymorphic_data_source_type :integer
#  workspace_id                 :integer
#  created_at                   :datetime         not null
#  updated_at                   :datetime         not null
#

class WorkspaceDataSource < ActiveRecord::Base
  belongs_to :workspace
  belongs_to :polymorphic_data_source, :polymorphic => true
end
