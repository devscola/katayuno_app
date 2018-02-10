class BeltsController < ApplicationController
  before_action :authenticate_admin!, only: [:create, :edit, :update, :destroy]
  before_action :set_belt, only: [:edit, :update, :destroy]

  def create
    @kata = Kata.find(params[:kata_id])
    @belt = Belt.new(
      name: params[:name],
      description: params[:description],
      image: params[:image],
      kata: params[:kata_id]
    )

    if @belt.save
      redirect_to kata_path(params[:kata_id])
    else
      @belts = Belt.all
      render 'katas/show'
    end
  end

  def edit
  end

  def update
    result = @belt.update(
      name: params[:name],
      description: params[:description],
      image: params[:image]
    )

    if result
      redirect_to kata_path(@belt.kata)
    else
      render :edit
    end

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
