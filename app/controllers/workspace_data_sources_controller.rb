class WorkspaceDataSourcesController < ApplicationController
  before_action :set_workspace_data_source, only: [:show, :edit, :update, :destroy]

  # GET /workspace_data_sources
  def index
    @workspace_data_sources = WorkspaceDataSource.all
  end

  # GET /workspace_data_sources/1
  def show
  end

  # GET /workspace_data_sources/new
  def new
    @workspace_data_source = WorkspaceDataSource.new
  end

  # GET /workspace_data_sources/1/edit
  def edit
  end

  # POST /workspace_data_sources
  def create
    @workspace_data_source = WorkspaceDataSource.new(workspace_data_source_params)

    if @workspace_data_source.save
      redirect_to @workspace_data_source, notice: 'Workspace data source was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /workspace_data_sources/1
  def update
    if @workspace_data_source.update(workspace_data_source_params)
      redirect_to @workspace_data_source, notice: 'Workspace data source was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /workspace_data_sources/1
  def destroy
    @workspace_data_source.destroy
    redirect_to workspace_data_sources_url, notice: 'Workspace data source was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_workspace_data_source
      @workspace_data_source = WorkspaceDataSource.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def workspace_data_source_params
      params.require(:workspace_data_source).permit(:polymorphic_data_source_id, :polymorphic_data_source_type, :workspace_id)
    end
end
