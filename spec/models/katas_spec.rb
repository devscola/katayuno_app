require 'rails_helper'

describe 'Katas' do
  it 'needs a title and description' do
    no_title = ''
    no_description = ''
    kata = Kata.new(
      title: no_title,
      description: no_description
    )

    kata.save

    expect(kata.errors.size).to eq(2)
    expect(kata.errors.messages[:title]).to eq(["can't be blank"])
    expect(kata.errors.messages[:description]).to eq(["can't be blank"])
  end
end
