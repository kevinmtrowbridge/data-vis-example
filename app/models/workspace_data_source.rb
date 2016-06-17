class WorkspaceDataSource < ActiveRecord::Base
  belongs_to :workspace
  belongs_to :polymorphic_data_source, :polymorphic => true

  # has_many :associated_datasets, :dependent => :destroy
  # has_many :datasets, :through => :associated_datasets
end