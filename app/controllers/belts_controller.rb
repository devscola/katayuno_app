class BeltsController < ApplicationController
  def create
    belt = Belt.new(
      name: params[:name],
      description: params[:description]
    )
    belt.save

    redirect_to kata_path(params[:kata_id])
  end
end
