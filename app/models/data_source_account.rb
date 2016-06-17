class DataSourceAccount < ActiveRecord::Base
  belongs_to :data_source
  belongs_to :user
  belongs_to :workspace
end