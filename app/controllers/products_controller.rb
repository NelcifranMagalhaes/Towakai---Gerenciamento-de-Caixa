class ProductsController < ApplicationController
  load_and_authorize_resource
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    @q = Product.joins(:product_type).order(name: :asc).merge(ProductType.order(name: :asc)).ransack(params[:q])
    @products = @q.result.page(params[:page]).per(10)
    @all_products = Product.where("quantity > 0")
    @quantity_of_products = quantity_of_products(@all_products)
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Produto Criado.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Produto atualizado.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    if @product.orders.size == 0
      @product.destroy
      respond_to do |format|
        format.html { redirect_to products_url, notice: 'Produto Deletado.' }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to products_url, notice: 'Produto Não pode ser deletado,porque está em uma venda.' }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    def quantity_of_products(products)
      count = 0
      products.each do |product|
        count = count + product.quantity 
      end
      return count    
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:cost_price, :sale_price, :name, :quantity,:low_quantity,:product_type_id)
    end
end
