class DataSourceAccountsController < ApplicationController
  before_action :set_data_source_account, only: [:show, :edit, :update, :destroy]

  # GET /data_source_accounts
  def index
    @data_source_accounts = DataSourceAccount.all
  end

  # GET /data_source_accounts/1
  def show
  end

  # GET /data_source_accounts/new
  def new
    @data_source_account = DataSourceAccount.new
  end

  # GET /data_source_accounts/1/edit
  def edit
  end

  # POST /data_source_accounts
  def create
    @data_source_account = DataSourceAccount.new(data_source_account_params)

    if @data_source_account.save
      redirect_to @data_source_account, notice: 'Data source account was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /data_source_accounts/1
  def update
    if @data_source_account.update(data_source_account_params)
      redirect_to @data_source_account, notice: 'Data source account was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /data_source_accounts/1
  def destroy
    @data_source_account.destroy
    redirect_to data_source_accounts_url, notice: 'Data source account was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_data_source_account
      @data_source_account = DataSourceAccount.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def data_source_account_params
      params.require(:data_source_account).permit(:password, :data_source_id, :user_id, :workspace_id)
    end
end
