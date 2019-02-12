class ClientsController < ApplicationController
  load_and_authorize_resource
  before_action :set_client, only: [:show, :edit, :update, :destroy]
  # GET /clients
  # GET /clients.json
  def index
    @q = Client.ransack(params[:q])
    @clients = @q.result.page(params[:page]).per(10)
  end

  # GET /clients/1
  # GET /clients/1.json
  def show
  end

  # GET /clients/new
  def new
    @client = Client.new
  end

  # GET /clients/1/edit
  def edit
  end

  # POST /clients
  # POST /clients.json
  def create
    @client = Client.new(client_params)

    respond_to do |format|
      if @client.save
        format.html { redirect_to @client, notice: 'Cliente Cadastrado.' }
        format.json { render :show, status: :created, location: @client }
      else
        format.html { render :new }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clients/1
  # PATCH/PUT /clients/1.json
  def update
    respond_to do |format|
      if @client.update(client_params)
        format.html { redirect_to @client, notice: 'Cliente Atualizado.' }
        format.json { render :show, status: :ok, location: @client }
      else
        format.html { render :edit }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clients/1
  # DELETE /clients/1.json
  def destroy
    if @client.sales.size == 0
      @client.destroy
      respond_to do |format|
        format.html { redirect_to clients_url, notice: 'Cliente Deletado.' }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to clients_url, notice: 'Cliente não pode ser deletado porque está em uma Venda.' }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client
      @client = Client.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def client_params
      params.require(:client).permit(:name, :address,:email,:phone,:cpf,:cnpj,:client_type_id)
    end
end
