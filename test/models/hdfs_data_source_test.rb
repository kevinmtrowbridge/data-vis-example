require "test_helper"

class HdfsDataSourceTest < ActiveSupport::TestCase
  def hdfs_data_source
    @hdfs_data_source ||= HdfsDataSource.new
  end

  def test_valid
    assert hdfs_data_source.valid?
  end
end
