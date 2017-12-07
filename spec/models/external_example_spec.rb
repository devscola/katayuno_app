require 'rails_helper'

describe 'External Example' do
  it 'belongs to a Kata' do
    example = ExternalExample.new(
      text: 'Example text',
      url: 'https://example.url',
      kata: nil
    )

    example.save

    expect(example.errors.size).to eq(1)
    expect(example.errors[:kata]).to eq(["can't be blank"])
  end

  it 'has a HTTPS url' do
    any_kata = 1
    example = ExternalExample.new(
      text: 'Example text',
      url: 'http://example.url',
      kata: any_kata
    )

    example.save

    expect(example.errors.size).to eq(1)
    expect(example.errors[:url]).to eq(["is invalid"])
  end

  it 'has to have a text and url' do
    any_kata = 1
    example = ExternalExample.new(
      text: nil,
      url: nil,
      kata: any_kata
    )

    example.save

    expect(example.errors.size).to eq(3)
    expect(example.errors[:text]).to eq(["can't be blank"])
    expect(example.errors[:url]).to eq(["can't be blank", "is invalid"])
  end
end
