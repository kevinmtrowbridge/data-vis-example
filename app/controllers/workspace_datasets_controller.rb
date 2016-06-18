class WorkspaceDatasetsController < ApplicationController
  before_action :set_workspace_dataset, only: [:show, :edit, :update, :destroy]

  # GET /workspace_datasets
  def index
    @workspace_datasets = WorkspaceDataset.all
  end

  # GET /workspace_datasets/1
  def show
  end

  # GET /workspace_datasets/new
  def new
    @workspace_dataset = WorkspaceDataset.new
  end

  # GET /workspace_datasets/1/edit
  def edit
  end

  # POST /workspace_datasets
  def create
    @workspace_dataset = WorkspaceDataset.new(workspace_dataset_params)

    if @workspace_dataset.save
      redirect_to @workspace_dataset, notice: 'Workspace dataset was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /workspace_datasets/1
  def update
    if @workspace_dataset.update(workspace_dataset_params)
      redirect_to @workspace_dataset, notice: 'Workspace dataset was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /workspace_datasets/1
  def destroy
    @workspace_dataset.destroy
    redirect_to workspace_datasets_url, notice: 'Workspace dataset was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_workspace_dataset
      @workspace_dataset = WorkspaceDataset.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def workspace_dataset_params
      params.require(:workspace_dataset).permit(:dataset_id, :workspace_id)
    end
end
