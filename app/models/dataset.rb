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

  def self.accessible_to(options)
    workspace = options[:workspace]
    user = options[:user]

    datasets = workspace.datasets


    # Naive implementation

    # datasets.each do |d|
    #   unless d.data_source.accessible_to?(options)
    #     raise "Dataset not accessible to workspace"
    #   end
    # end


    # This will scale better

    # dataset_data_source_ids = datasets.pluck(:data_source_id).compact
    # accessible_data_sources = DataSource.accessible_to(options).pluck(:id)
    # if (dataset_data_source_ids - accessible_data_sources).any?
    #   raise "Dataset not accessible to workspace"
    # end
    #
    # dataset_hdfs_data_source_ids = datasets.pluck(:hdfs_data_source_id).compact
    # accessible_hdfs_data_sources = HdfsDataSource.accessible_to(options).pluck(:id)
    # if (dataset_hdfs_data_source_ids - accessible_hdfs_data_sources).any?
    #   raise "Hdfs Dataset not accessible to workspace"
    # end


    datasets
  end

  def polymorphic_data_source
    if data_source.present?
      data_source
    elsif hdfs_data_source.present?
      hdfs_data_source
    end
  end

  def explain_accessible_to(options)
    workspace = options[:workspace]
    user = options[:user]

    if polymorphic_data_source.present?
      polymorphic_data_source.explain_accessible_to(options)
    else
      raise "No explanation for why dataset accessible"
    end

  end

end
