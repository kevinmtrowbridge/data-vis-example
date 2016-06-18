class WorkspacesController < ApplicationController
  before_action :set_workspace_and_user, only: [:show, :edit, :update, :destroy]

  # GET /workspaces
  def index
    @workspaces = Workspace.all
  end

  # GET /workspaces/1
  def show
    @data_sources = DataSource.accessible_to(:workspace => @workspace, :user => User.first)
    @hdfs_data_sources = HdfsDataSource.accessible_to(:workspace => @workspace, :user => User.first)
    @datasets = Dataset.accessible_to(:workspace => @workspace, :user => User.first)
  end

  # GET /workspaces/new
  def new
    @workspace = Workspace.new
  end

  # GET /workspaces/1/edit
  def edit
  end

  # POST /workspaces
  def create
    @workspace = Workspace.new(workspace_params)

    if @workspace.save
      redirect_to @workspace, notice: 'Workspace was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /workspaces/1
  def update
    if @workspace.update(workspace_params)
      redirect_to @workspace, notice: 'Workspace was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /workspaces/1
  def destroy
    @workspace.destroy
    redirect_to workspaces_url, notice: 'Workspace was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_workspace_and_user
      @user = User.first
      @workspace = Workspace.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def workspace_params
      params.require(:workspace).permit(:name)
    end
end
