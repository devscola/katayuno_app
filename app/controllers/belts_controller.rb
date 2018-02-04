class BeltsController < ApplicationController
  before_action :authenticate_admin!, only: [:create, :edit, :update, :destroy]

  def create
    belt = Belt.new(
      name: params[:name],
      description: params[:description],
      image: params[:image],
      kata: params[:kata_id]
    )
    belt.save

    redirect_to kata_path(params[:kata_id])
  end

  def edit
    @belt = Belt.find(params[:id])
  end

  def update
    belt = Belt.find(params[:id])
    belt.name = params[:name]
    belt.description = params[:description]
    belt.image = params[:image]
    belt.save

    redirect_to kata_path(belt.kata)
  end

  def destroy
    belt = Belt.find(params[:id])
    kata_id = belt.kata

    belt.destroy
    redirect_to kata_path(kata_id)
  end
end
