class StatusSalesController < ApplicationController
  load_and_authorize_resource
  before_action :set_status_sale, only: [:show, :edit, :update, :destroy]

  # GET /status_sales
  # GET /status_sales.json
  def index
    @q = StatusSale.order(name: :asc).ransack(params[:q])
    @status_sales = @q.result.page(params[:page]).per(10)
  end

  # GET /status_sales/1
  # GET /status_sales/1.json
  def show
  end

  # GET /status_sales/new
  def new
    @status_sale = StatusSale.new
  end

  # GET /status_sales/1/edit
  def edit
  end

  # POST /status_sales
  # POST /status_sales.json
  def create
    @status_sale = StatusSale.new(status_sale_params)

    respond_to do |format|
      if @status_sale.save
        format.html { redirect_to @status_sale, notice: 'Status de venda Criada com sucesso.' }
        format.json { render :show, status: :created, location: @status_sale }
      else
        format.html { render :new }
        format.json { render json: @status_sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /status_sales/1
  # PATCH/PUT /status_sales/1.json
  def update
    respond_to do |format|
      if @status_sale.update(status_sale_params)
        format.html { redirect_to @status_sale, notice: 'Status de venda atualizada com sucesso.' }
        format.json { render :show, status: :ok, location: @status_sale }
      else
        format.html { render :edit }
        format.json { render json: @status_sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /status_sales/1
  # DELETE /status_sales/1.json
  def destroy
    @status_sale.destroy
    respond_to do |format|
      format.html { redirect_to status_sales_url, notice: 'Status de venda deletada com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_status_sale
      @status_sale = StatusSale.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def status_sale_params
      params.require(:status_sale).permit(:name, :description)
    end
end
