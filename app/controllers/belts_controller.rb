class BeltsController < ApplicationController
  before_action :authenticate_admin!, only: [:create, :edit, :update, :destroy]
  before_action :set_belt, only: [:edit, :update, :destroy]

  def create
    @belt = Belt.new(
      name: params[:name],
      description: params[:description],
      image: params[:image],
      kata: params[:kata_id]
    )
    @belt.save

    redirect_to kata_path(params[:kata_id])
  end

  def edit
  end

  def update
    @belt.update(
      name: params[:name],
      description: params[:description],
      image: params[:image]
    )

    redirect_to kata_path(@belt.kata)
  end

  def destroy
    kata_id = @belt.kata

    @belt.destroy

    redirect_to kata_path(kata_id)
  end

  private

  def set_belt
    @belt = Belt.find(params[:id])
  end
end
