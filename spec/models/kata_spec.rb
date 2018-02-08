require 'rails_helper'

describe 'Kata' do
  it 'needs a title and description' do
    no_title = ''
    no_description = ''
    kata = Kata.new(
      title: no_title,
      description: no_description
    )

    kata.save

    expect(kata.errors.size).to eq(2)
    expect(kata.errors.messages[:title]).to eq([empty_title_message_error])
    expect(kata.errors.messages[:description]).to eq([empty_description_message_error])
  end

  def empty_title_message_error
    I18n.t(:empty_title)
  end

  def empty_description_message_error
    I18n.t(:empty_description)
  end
end
