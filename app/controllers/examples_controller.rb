class ExamplesController < ApplicationController
  before_action :authenticate_user!, only: [:update, :edit, :destroy]
  before_action :set_kata, only: [:index, :create]
  before_action :set_example, only: [:edit, :update, :destroy]

  def index
    @examples = Example.for(@kata.id)
  end

  def create
    if current_user
      user_id = current_user.id
      @example = Example.new(
        text: params[:text],
        url: params[:url],
        kata: @kata.id,
        user: user_id
      )
      @example.save
    else
      @example = Example.new(
        text: params[:text],
        url: params[:url],
        kata: @kata.id
      )
      @example.save
    end

    redirect_to examples_path(@kata.id)
  end

  def edit
  end

  def update
    @example.update(
      text: params[:example][:text],
      url: params[:example][:url]
    )

    redirect_to examples_path(@example.kata)
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
end
