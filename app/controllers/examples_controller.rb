class ExamplesController < ApplicationController
  def index
    @kata = Kata.find(params[:kata_id])
    @examples = Example.for(@kata.id)
  end

  def create
    kata = Kata.find(params[:kata_id])
    example = Example.new(
      text: params[:text],
      url: params[:url],
      kata: kata.id
    )
    example.save

    redirect_to examples_path(kata.id)
  end
end
