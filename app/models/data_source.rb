class DataSource < ActiveRecord::Base
  has_many :workspace_data_sources, :as => :polymorphic_data_source
  has_many :workspaces, :through => :workspace_data_sources
  has_many :data_source_accounts

  def self.accessible_to?(options)
    user = options[:user]
    workspace = options[:workspace]

    if workspace
      data_source_accounts.where(:workspace => workspace)
    elsif user
      data_source_accounts.where(:user => user)
    else
      []
    end
  end

  def accessible_to?(options)
    self.accessible_to(options).any?
  end
end