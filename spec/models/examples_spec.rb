require 'rails_helper'

describe 'Example' do
  it 'belongs to a Kata' do
    example = Example.new(
      text: 'Example text',
      url: 'http://example.url',
      kata: nil
    )

    example.save

    expect(example.errors.size).to eq(1)
    expect(example.errors[:kata]).to eq(["can't be blank"])
  end
end
