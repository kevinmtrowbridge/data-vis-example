class HdfsDataSourcesController < ApplicationController
  before_action :set_hdfs_data_source, only: [:show, :edit, :update, :destroy]

  # GET /hdfs_data_sources
  def index
    @hdfs_data_sources = HdfsDataSource.all
  end

  # GET /hdfs_data_sources/1
  def show
  end

  # GET /hdfs_data_sources/new
  def new
    @hdfs_data_source = HdfsDataSource.new
  end

  # GET /hdfs_data_sources/1/edit
  def edit
  end

  # POST /hdfs_data_sources
  def create
    @hdfs_data_source = HdfsDataSource.new(hdfs_data_source_params)

    if @hdfs_data_source.save
      redirect_to @hdfs_data_source, notice: 'Hdfs data source was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /hdfs_data_sources/1
  def update
    if @hdfs_data_source.update(hdfs_data_source_params)
      redirect_to @hdfs_data_source, notice: 'Hdfs data source was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /hdfs_data_sources/1
  def destroy
    @hdfs_data_source.destroy
    redirect_to hdfs_data_sources_url, notice: 'Hdfs data source was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hdfs_data_source
      @hdfs_data_source = HdfsDataSource.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def hdfs_data_source_params
      params.require(:hdfs_data_source).permit(:name, :public)
    end
end
