require_relative 'helpers'
require 'rails_helper'
require 'capybara'

describe 'Examples' do
  it 'can be added to a Kata' do
    kata = create_kata
    example_text = 'Example text'

    visit kata_path(kata.id)
    click_on('Examples')
    fill_in('text', with: example_text)
    fill_in('url', with: 'http://example.url')
    click_on('Add Example')

    expect(page).to have_content(example_text)
  end
end
