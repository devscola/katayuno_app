class ExternalExamplesController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update, :destroy]
  before_action :set_example, only: [:edit, :update, :destroy]

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

  def edit
  end

  def update
    @example.text = params[:external_example][:text]
    @example.url = params[:external_example][:url]
    @example.save

    redirect_to external_examples_path(@example.kata)
  end

  def destroy
    @example.destroy

    redirect_to external_examples_path(params[:kata_id])
  end

  private

  def set_example
    @example = ExternalExample.find(params[:id])
  end
end
