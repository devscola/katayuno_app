require_relative 'helpers'
require 'rails_helper'
require 'capybara'

describe 'External examples' do
  context 'by admin' do
    it 'can be created' do
      example_text = 'External example text'
      example_link = 'http://external-example.com'
      kata = create_external_kata

      visit root_path
      click_on('Examples')
      fill_in('text', with: example_text)
      fill_in('url', with: example_link)
      click_on('Save')

      expect(page).to have_link(example_text, href: example_link)
    end
  end
end
