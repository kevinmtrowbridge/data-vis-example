class WorkspaceHdfsDataSourcesController < ApplicationController
  before_action :set_ivars, only: [:index, :show]

  # GET /workspace_hdfs_data_sources
  def index
    @hdfs_data_sources = HdfsDataSource.accessible_to(:workspace => @workspace, :user => User.first)

    array_of_hashes = @hdfs_data_sources.collect{|hds| hds.merge_connection_parameters_for(:workspace => @workspace, :user => User.first)}

    render :text => array_of_hashes.to_json
  end

  # GET /workspace_hdfs_data_source/1
  def show
    @hdfs_data_source = HdfsDataSource.accessible_to(:workspace => @workspace, :user => User.first).find(params[:id])
    merged_hash = @hdfs_data_source.merge_connection_parameters_for(:workspace => @workspace, :user => User.first)
    render :text => merged_hash.to_json
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_ivars
      @workspace = Workspace.find(params[:workspace_id])
    end

end
