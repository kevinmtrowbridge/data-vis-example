require "test_helper"

class WorkspaceDataSourceTest < ActiveSupport::TestCase
  def workspace_data_source
    @workspace_data_source ||= WorkspaceDataSource.new
  end

  def test_valid
    assert workspace_data_source.valid?
  end
end
