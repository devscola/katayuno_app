class PingController < ApplicationController
  def ping
    render :json => { message: 'Pong' }
  end
end
