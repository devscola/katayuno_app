require 'rails_helper'
require 'json'

describe PingController do
  it 'responds with Pong' do
    response_json = { message: 'Pong' }.to_json

    post :ping

    expect(response.body).to eq(response_json)
  end
end
