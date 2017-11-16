class BeltsController < ApplicationController
  def create
    belt = Belt.new(
      name: params[:name],
      description: params[:description]
    )
    belt.save

    redirect_to kata_path(params[:kata_id])
  end

  def destroy
    belt = Belt.find(params[:id])
    kata_id = belt.kata

    belt.destroy
    redirect_to kata_path(kata_id)
  end
end
