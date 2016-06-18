# == Schema Information
#
# Table name: data_sources
#
#  id         :integer          not null, primary key
#  name       :string
#  public     :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class DataSource < ActiveRecord::Base
  has_many :workspace_data_sources, :as => :polymorphic_data_source
  has_many :workspaces, :through => :workspace_data_sources
  has_many :data_source_accounts

  def self.accessible_to(options)
    user = options[:user]
    workspace = options[:workspace]

    ids = []
    if workspace
      ids = DataSourceAccount.where('workspace_id = ? OR user_id = ?', workspace, user).pluck(:data_source_id)
    elsif user
      ids = DataSourceAccount.where(user_id = ?', workspace, user).pluck(&:data_source_id)
    end

    DataSource.where("id IN (?) OR public = ?", ids, true)
  end

  def data_source_account_for(options)
    user = options[:user]
    workspace = options[:workspace]

    if workspace
      return data_source_accounts.where('workspace_id = ? OR user_id = ?', workspace, user).first
    elsif user
      return data_source_accounts.where(:user => user).first
    end

    nil
  end

  def accessible_to?(options)
    data_source_account_for(options).present?
  end

  def explain_accessible_to(options)
    user = options[:user]
    workspace = options[:workspace]

    if workspace && data_source_accounts.where(:workspace => workspace).any?
      return 'this data source is accessible to this workspace'
    elsif user && data_source_accounts.where(:user => user).any?
      return 'this data source is accessible to your user'
    elsif public
      return 'this data source is public, accessible to all workspaces'
    end

    "not accessible"
  end
end
