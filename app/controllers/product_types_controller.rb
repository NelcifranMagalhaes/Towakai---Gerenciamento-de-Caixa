# frozen_string_literal: true

class ProductTypesController < ApplicationController
  load_and_authorize_resource
  before_action :set_product_type, only: %i[show edit update destroy]

  # GET /product_types
  # GET /product_types.json
  def index
    @q = ProductType.order(name: :asc).ransack(params[:q])
    @product_types = @q.result.page(params[:page]).per(10)
  end

  # GET /product_types/1
  # GET /product_types/1.json
  def show; end

  # GET /product_types/new
  def new
    @product_type = ProductType.new
  end

  # GET /product_types/1/edit
  def edit; end

  # POST /product_types
  # POST /product_types.json
  def create
    @product_type = ProductType.new(product_type_params)

    respond_to do |format|
      if @product_type.save
        format.html { redirect_to @product_type, notice: 'Tipo de Produto criado.' }
        format.json { render :show, status: :created, location: @product_type }
      else
        format.html { render :new }
        format.json { render json: @product_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /product_types/1
  # PATCH/PUT /product_types/1.json
  def update
    respond_to do |format|
      if @product_type.update(product_type_params)
        format.html { redirect_to @product_type, notice: 'Tipo de Produto atualizado.' }
        format.json { render :show, status: :ok, location: @product_type }
      else
        format.html { render :edit }
        format.json { render json: @product_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /product_types/1
  # DELETE /product_types/1.json
  def destroy
    @product_type.destroy
    respond_to do |format|
      format.html { redirect_to product_types_url, notice: 'Tipo de Produto deletado.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_product_type
    @product_type = ProductType.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def product_type_params
    params.require(:product_type).permit(:name, :color, :size, :product_specification_id)
  end
end
