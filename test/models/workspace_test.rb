require_relative "../test_helper"

describe Workspace do
  let(:workspace) { Workspace.create }

  it "must be valid" do
    workspace.data_sources << DataSource.create
    workspace.hdfs_data_sources << HdfsDataSource.create

    assert workspace.workspace_data_sources.count == 2
  end
end
