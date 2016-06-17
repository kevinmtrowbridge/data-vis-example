class WorkspaceDataset < ActiveRecord::Base
  belongs_to :dataset
  belongs_to :workspace
end
