# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: %i[edit update destroy]

  def index
    @users = User.all
  end

  def edit; end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to users_path, notice: 'Usuário atualizado.'
    else
      redirect_to users_path, notice: 'Você não pode atualizar o Usuário.'
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'Usuário Deletado.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(role_ids: [])
  end
  # Never trust parameters from the scary internet, only allow the white list through.
  # def user_params
  #   params.require(:user).permit(:name, :address)
  # end
end
