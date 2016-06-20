class WorkspaceDataSourcesApiController < ApplicationController
  before_action :set_ivars, only: [:index, :show]

  # GET /workspace_data_sources
  def index
    @data_sources = DataSource.accessible_to(:workspace => @workspace, :user => User.first)
    render :text => @data_sources.to_json
  end

  # GET /workspace_data_sources/1
  def show
    @data_source = DataSource.accessible_to(:workspace => @workspace, :user => User.first).find(params[:id])
    render :text => @data_source.to_json
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_ivars
      @workspace = Workspace.find(params[:workspace_id])
    end

end
