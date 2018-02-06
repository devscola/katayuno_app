class KatasController < ApplicationController
  before_action :set_kata, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @katas = Kata.all
  end

  def show
    kata_id = params[:id]
    @belts = Belt.ordered_for(kata_id)
  end

  def new
    @kata = Kata.new
  end

  def create
    kata = Kata.new(kata_params)
    kata.save

    redirect_to kata_path(kata.id)
  end

  def edit
  end

  def update
    @kata.update(kata_params)

    redirect_to kata_path(@kata.id)
  end

  def destroy
    @kata.destroy

    redirect_to katas_path
  end

  private

  def set_kata
    @kata = Kata.find(params[:id])
  end

  def kata_params
    params.require(:kata).permit(:title, :description)
  end
end
