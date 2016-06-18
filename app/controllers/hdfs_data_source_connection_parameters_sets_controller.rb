class HdfsDataSourceConnectionParametersSetsController < ApplicationController
  before_action :set_hdfs_data_source_connection_parameters_set, only: [:show, :edit, :update, :destroy]

  # GET /hdfs_data_source_connection_parameters_sets
  def index
    @hdfs_data_source_connection_parameters_sets = HdfsDataSourceConnectionParametersSet.all
  end

  # GET /hdfs_data_source_connection_parameters_sets/1
  def show
  end

  # GET /hdfs_data_source_connection_parameters_sets/new
  def new
    @hdfs_data_source_connection_parameters_set = HdfsDataSourceConnectionParametersSet.new
  end

  # GET /hdfs_data_source_connection_parameters_sets/1/edit
  def edit
  end

  # POST /hdfs_data_source_connection_parameters_sets
  def create
    @hdfs_data_source_connection_parameters_set = HdfsDataSourceConnectionParametersSet.new(hdfs_data_source_connection_parameters_set_params)

    if @hdfs_data_source_connection_parameters_set.save
      redirect_to @hdfs_data_source_connection_parameters_set, notice: 'Hdfs data source connection parameters set was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /hdfs_data_source_connection_parameters_sets/1
  def update
    if @hdfs_data_source_connection_parameters_set.update(hdfs_data_source_connection_parameters_set_params)
      redirect_to @hdfs_data_source_connection_parameters_set, notice: 'Hdfs data source connection parameters set was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /hdfs_data_source_connection_parameters_sets/1
  def destroy
    @hdfs_data_source_connection_parameters_set.destroy
    redirect_to hdfs_data_source_connection_parameters_sets_url, notice: 'Hdfs data source connection parameters set was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hdfs_data_source_connection_parameters_set
      @hdfs_data_source_connection_parameters_set = HdfsDataSourceConnectionParametersSet.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def hdfs_data_source_connection_parameters_set_params
      params.require(:hdfs_data_source_connection_parameters_set).permit(:connection_parameters, :hdfs_data_source_id, :user_id, :workspace_id)
    end
end
