class ExamplesController < ApplicationController

  def index
    @kata = Kata.find(params[:kata_id])
    @examples = Example.for(@kata.id)
  end

  def create
    kata = Kata.find(params[:kata_id])

    if current_user
      user_id = current_user.id
      example = Example.new(
        text: params[:text],
        url: params[:url],
        kata: kata.id,
        user: user_id
      )
      example.save
    else
      example = Example.new(
        text: params[:text],
        url: params[:url],
        kata: kata.id
      )
      example.save
    end

    redirect_to examples_path(kata.id)
  end

  def edit
    @example = Example.find(params[:id])
  end

  def update
    example = Example.find(params[:id])
    example.text = params[:example][:text]
    example.url = params[:example][:url]
    example.save

    redirect_to examples_path(example.kata)
  end

  def destroy
    example = Example.find(params[:id])
    kata = example.kata
    example.destroy

    redirect_to examples_path(kata)
  end
end
