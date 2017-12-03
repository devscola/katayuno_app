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
      external_kata = create_external_kata

      visit root_path

      expect(page).not_to have_content('Delete')
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
      fill_in(:name, with: external_kata_name)
      fill_in(:url, with: external_kata_url)
      click_on('Add external Kata')

      expect(page).to have_link(external_kata_name, href: external_kata_url)
    end

    it 'can be deleted' do
      external_kata = create_external_kata

      visit root_path
      click_on('Delete')

      expect(page).not_to have_content(external_kata.name)
    end
  end

  def create_external_kata(name='External kata', url='http://external-kata.com')
    kata = ExternalKata.new(
      name: name,
      url: url
    )
    kata.save
    kata
  end
end
