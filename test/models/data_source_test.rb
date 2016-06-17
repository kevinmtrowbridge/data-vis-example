require_relative "../test_helper"

describe DataSource do

  it "must have #accessible_to" do
    u = User.create
    ds = DataSource.create
    dsa = DataSourceAccount.create(:user => u, :data_source => ds)

    assert ds.accessible_to?(u)
  end
end