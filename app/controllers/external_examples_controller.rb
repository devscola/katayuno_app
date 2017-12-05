class ExternalExamplesController < ApplicationController
  def index
    @kata = ExternalKata.find(params[:kata_id])
    @examples = ExternalExample.for(params[:kata_id])
  end

  def create
    example = ExternalExample.new(
      text: params[:text],
      url: params[:url],
      kata: params[:id]
    )
    example.save

    redirect_to external_examples_path(params[:id])
  end
end
