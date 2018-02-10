class KatasController < ApplicationController
  before_action :set_kata, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @katas = Kata.all
  end

  def show
    @belts = Belt.ordered_for(params[:id])
    @belt = Belt.new
  end

  def new
    @kata = Kata.new
  end

  def create
    @kata = Kata.new(kata_params)

    if @kata.save
      redirect_to kata_path(@kata.id)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @kata.update(kata_params)
      redirect_to kata_path(@kata.id)
    else
      render :edit
    end
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
