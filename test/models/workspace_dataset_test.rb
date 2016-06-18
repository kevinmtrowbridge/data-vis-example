require "test_helper"

class WorkspaceDatasetTest < ActiveSupport::TestCase
  def workspace_dataset
    @workspace_dataset ||= WorkspaceDataset.new
  end

  def test_valid
    assert workspace_dataset.valid?
  end
end
