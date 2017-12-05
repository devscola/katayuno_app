class ExternalExamplesController < ApplicationController
  def index
    @kata = ExternalKata.find(params[:kata_id])
    @examples = ExternalExample.for(params[:kata_id])
  end

  def create
    if current_user
      example = ExternalExample.new(
        text: params[:text],
        url: params[:url],
        kata: params[:id],
        user: current_user.id
      )
    else
      example = ExternalExample.new(
        text: params[:text],
        url: params[:url],
        kata: params[:id]
      )
    end
    example.save

    redirect_to external_examples_path(params[:id])
  end

  def destroy
    example = ExternalExample.find(params[:id])
    example.destroy

    redirect_to external_examples_path(params[:kata_id])
  end
end
