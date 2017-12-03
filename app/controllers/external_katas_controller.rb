class ExternalKatasController < ApplicationController
  before_action :authenticate_admin!, only: [:new, :create, :destroy]

  def new
  end

  def create
    external_kata = ExternalKata.new(
      name: params[:name],
      url: params[:url]
    )
    external_kata.save

    redirect_to root_path
  end

  def destroy
    external_kata = ExternalKata.find(params[:id])
    external_kata.destroy

    redirect_to root_path
  end
end
