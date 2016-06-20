class WorkspaceDataSourceAccountsApiController < ApplicationController
  before_action :set_ivars, only: [:show]

  # GET /data_source_accounts/1
  def show
    @data_source_account = DataSourceAccount.where(:workspace => @workspace, :data_source => @data_source)
    render :text => @data_source_account.to_json
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_ivars
      @workspace = Workspace.find(params[:workspace_id])
      @data_source = DataSource.find(params[:data_source_id])
    end

end
