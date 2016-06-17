require_relative "../test_helper"

describe DataSource do

  it "must have #accessible_to working for users" do
    u = User.create
    ds = DataSource.create

    refute ds.accessible_to?(:user => u)

    dsa = DataSourceAccount.create(:user => u, :data_source => ds)

    assert ds.accessible_to?(:user => u)
  end

  it "must have #accessible_to working for workspaces" do
    w = Workspace.create
    ds = DataSource.create

    refute ds.accessible_to?(:workspace => w)

    dsa = DataSourceAccount.create(:workspace => w, :data_source => ds)

    assert ds.accessible_to?(:workspace => w)
  end
end