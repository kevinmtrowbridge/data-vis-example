# == Schema Information
#
# Table name: data_source_accounts
#
#  id             :integer          not null, primary key
#  password       :string
#  data_source_id :integer
#  user_id        :integer
#  workspace_id   :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class DataSourceAccount < ActiveRecord::Base
  belongs_to :data_source
  belongs_to :user
  belongs_to :workspace
end
