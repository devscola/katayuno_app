require 'rails_helper'

describe 'External kata' do
  it 'has to have a name and URL' do
    external_kata = ExternalKata.new(
      name: nil,
      url: nil
    )

    external_kata.save

    expect(external_kata.errors.size).to eq(3)
    expect(external_kata.errors[:name]).to eq(["can't be blank"])
    expect(external_kata.errors[:url]).to eq(["can't be blank", "is invalid"])
  end
end
