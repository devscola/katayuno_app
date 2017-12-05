require_relative 'helpers'
require 'rails_helper'
require 'capybara'

describe 'External examples' do
  context 'by admin' do
    before(:each) do
      @admin = log_in_admin
    end

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

    it 'can be deleted' do
      example_text = 'External example text'
      example_link = 'http://external-example.com'
      kata = create_external_kata
      example = ExternalExample.new(
        text: example_text,
        url: example_link,
        kata: kata.id,
        user: @admin.id
      )
      example.save

      visit root_path
      click_on('Examples')
      click_on('Delete')

      expect(page).not_to have_link(example_text, href: example_link)
    end

    it 'can be edited' do
      edited_example_text = 'Edited example'
      edited_example_link = 'http://edited-example.com'
      kata = create_external_kata
      example = ExternalExample.new(
        text: 'External example text',
        url: 'http://external-example.com',
        kata: kata.id,
        user: @admin.id
      )
      example.save

      visit root_path
      click_on('Examples')
      click_on('Edit')
      fill_in('external_example_text', with: edited_example_text)
      fill_in('external_example_url', with: edited_example_link)
      click_on('Save')

      expect(page).to have_link(edited_example_text, href: edited_example_link)
    end
  end
end
