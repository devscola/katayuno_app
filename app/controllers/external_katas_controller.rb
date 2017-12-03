class ExternalKatasController < ApplicationController
  before_action :authenticate_admin!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_external_kata, only: [:show, :edit, :update, :destroy]

  def new
    @external_kata = ExternalKata.new
  end

  def create
    external_kata = ExternalKata.new(external_kata_params)
    external_kata.save

    redirect_to root_path
  end

  def edit
  end

  def update
    @external_kata.update(external_kata_params)

    redirect_to root_path
  end

  def destroy
    @external_kata.destroy

    redirect_to root_path
  end

  private

  def set_external_kata
    @external_kata = ExternalKata.find(params[:id])
  end

  def external_kata_params
    params.require(:external_kata).permit(:name, :url)
  end
end
