class ExamplesController < ApplicationController
  before_action :authenticate_user!, only: [:update, :edit, :destroy]
  before_action :set_kata, only: [:index, :create]
  before_action :set_example, only: [:edit, :update, :destroy]
  before_action :allowed_user!, only: [:edit, :update, :destroy]

  def index
    @examples = Example.for(@kata.id)
    @example = Example.new
  end

  def create
    if current_user
      @example = Example.new(
        text: params[:text],
        url: params[:url],
        kata: @kata.id,
        user: current_user.id
      )
    else
      @example = Example.new(
        text: params[:text],
        url: params[:url],
        kata: @kata.id
      )
    end

    if @example.save
      redirect_to examples_path(@kata.id)
    else
      @examples = Example.for(@kata.id)
      render :index
    end
  end

  def edit
  end

  def update
    result = @example.update(
      text: params[:example][:text],
      url: params[:example][:url]
    )

    if result
      redirect_to examples_path(@example.kata)
    else
      render :edit
    end
  end

  def destroy
    kata = @example.kata

    @example.destroy

    redirect_to examples_path(kata)
  end

  private

  def set_kata
    @kata = Kata.find(params[:kata_id])
  end

  def set_example
    @example = Example.find(params[:id])
  end

  def allowed_user!
    redirect_to examples_path(@example.kata) unless allowed_user?
  end

  def allowed_user?
    !user_signed_in? || (current_user.id == @example.user || current_user.admin?)
  end
end
