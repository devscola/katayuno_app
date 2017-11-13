class KatasController < ApplicationController
  before_action :set_kata, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @katas = Kata.all
  end

  def show
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

  def authenticate_admin!
    redirect_to root_path unless user_signed_in?
    redirect_to root_path unless current_user.admin?
  end

  def set_kata
    @kata = Kata.find(params[:id])
  end

  def kata_params
    params.require(:kata).permit(:title, :description)
  end
end
