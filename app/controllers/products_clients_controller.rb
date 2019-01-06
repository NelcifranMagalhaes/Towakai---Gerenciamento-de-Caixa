class ProductsClientsController < ApplicationController
 	before_action :set_product_client, only: [:show, :edit, :update, :destroy]

	def index
		@products_clients = ProductClient.all
	end

	def show
	end

	def new
	  @product_client = ProductClient.new
	end

	def edit
	end

	def create
	  @product_client = ProductClient.new(product_client_params)

	  respond_to do |format|
	    if @product_client.save
	      format.html { redirect_to @product_client, notice: 'Venda Criada.' }
	      format.json { render :show, status: :created, location: @product_client }
	    else
	      format.html { render :new }
	      format.json { render json: @product_client.errors, status: :unprocessable_entity }
	    end
	  end
	end

	def update
	  respond_to do |format|
	    if @product_client.update(product_client_params)
	      format.html { redirect_to @product_client, notice: 'Venda Atualizada.' }
	      format.json { render :show, status: :ok, location: @product_client }
	    else
	      format.html { render :edit }
	      format.json { render json: @product_client.errors, status: :unprocessable_entity }
	    end
	  end
	end


	def destroy
	  @product_client.destroy
	  respond_to do |format|
	    format.html { redirect_to products_clients_url, notice: 'Venda Deletada.' }
	    format.json { head :no_content }
	  end
	end


	private
	  # Use callbacks to share common setup or constraints between actions.
	  def set_product_client
	    @product_client = ProductClient.find(params[:id])
	  end

	  # Never trust parameters from the scary internet, only allow the white list through.
	  def product_client_params
	    params.require(:product_client).permit(:date_sale, :product_id, :client_id)
	  end

end