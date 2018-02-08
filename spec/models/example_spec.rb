require 'rails_helper'

describe 'Example' do
  it 'belongs to a Kata' do
    example = Example.new(
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
    example = Example.new(
      text: 'Example text',
      url: 'http://example.url',
      kata: any_kata
    )

    example.save

    expect(example.errors.size).to eq(1)
    expect(example.errors[:url]).to eq([wrong_url_format_message_error])
  end

  it 'has to have a text and url' do
    any_kata = 1
    example = Example.new(
      text: nil,
      url: nil,
      kata: any_kata
    )

    example.save

    expect(example.errors.size).to eq(3)
    expect(example.errors[:text]).to eq([empty_text_message_error])
    expect(example.errors[:url]).to eq([empty_url_message_error, wrong_url_format_message_error])
  end

  it 'retrieves the examples for a Kata' do
    kata = Kata.new(title: 'any', description: 'any')
    kata.save
    example = Example.new(
      text: 'text',
      url: 'https://url.com',
      kata: kata.id
    )
    example.save

    retrieved_examples = Example.for(kata.id)

    expect(retrieved_examples.to_a).to eq([example])
  end

  it 'retrieves the examples that belongs to user' do
    user_id = 1
    kata = Kata.new(title: 'any', description: 'any')
    kata.save
    example = Example.new(
      text: 'text',
      url: 'https://url.com',
      kata: kata.id,
      user: user_id
    )
    example.save

    retrieved_examples = Example.belongs(kata.id)

    expect(retrieved_examples.to_a).to eq([example])
  end

  def empty_text_message_error
    I18n.t(:empty_text)
  end

  def wrong_url_format_message_error
    I18n.t(:wrong_url_format)
  end

  def empty_url_message_error
    I18n.t(:empty_url)
  end
end
