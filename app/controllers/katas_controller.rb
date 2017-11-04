class KatasController < ApplicationController
  def index
    @katas = Kata.all
  end

  def show
    @kata = Kata.find(params[:id])
  end

  def new
  end

  def create
    kata = Kata.new(
      title: params[:title],
      description: params[:description]
    )
    kata.save

    redirect_to kata_path(kata.id)
  end

  def edit
    @kata = Kata.find(params[:id])
  end

  def update
    kata = Kata.find(params[:id])
    kata.update(kata_params)

    redirect_to kata_path(kata.id)
  end

  private

  def kata_params
    params.require(:kata).permit(:title, :description)
  end
end
