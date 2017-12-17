require_relative 'helpers'
require 'rails_helper'
require 'capybara'

describe 'External Katas' do
  context 'for a non user' do
    it 'can not be added' do

      visit root_path

      expect(page).not_to have_content('Add external Kata')
    end

    it 'can not be deleted' do
      create_external_kata

      visit root_path

      expect(page).not_to have_content('Delete')
    end

    it 'can not be edited' do
      create_external_kata

      visit root_path

      expect(page).not_to have_content('Edit')
    end
  end

  context 'for a normal user' do
    before(:each) do
      log_in_user
    end

    it 'can not be added' do

      visit root_path

      expect(page).not_to have_content('Add external Kata')
    end

    it 'can not be deleted' do
      external_kata = create_external_kata

      visit root_path

      expect(page).not_to have_content('Delete')
    end

    it 'can not be edited' do
      create_external_kata

      visit root_path

      expect(page).not_to have_content('Edit')
    end
  end

  context 'for an admin' do
    before(:each) do
      log_in_admin
    end

    it 'can be added' do
      external_kata_name = 'External Kata name'
      external_kata_url = 'http://external-kata.com'

      visit root_path
      click_on('Add external Kata')
      fill_in('external_kata_name', with: external_kata_name)
      fill_in('external_kata_url', with: external_kata_url)
      click_on('Save')

      expect(page).to have_link(external_kata_name, href: external_kata_url)
    end

    it 'can be deleted' do
      external_kata = create_external_kata

      visit root_path
      click_on('delete')

      expect(page).not_to have_content(external_kata.name)
    end

    it 'can be edited' do
      create_external_kata
      edited_external_kata_name = 'Edited external kata'
      edited_external_kata_url = 'http://edited-external-kata.com'

      visit root_path
      click_on('mode_edit')
      fill_in('external_kata_name', with: edited_external_kata_name)
      fill_in('external_kata_url', with: edited_external_kata_url)
      click_on('Save')

      expect(page).to have_link(edited_external_kata_name, href: edited_external_kata_url)
    end
  end
end
