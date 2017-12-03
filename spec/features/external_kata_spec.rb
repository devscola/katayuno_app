require_relative 'helpers'
require 'rails_helper'
require 'capybara'

describe 'External Katas' do
  it 'can not be added by a non user' do

    visit root_path

    expect(page).not_to have_content('Add external Kata')
  end

  it 'can not be added by a normal user' do
    log_in_user

    visit root_path

    expect(page).not_to have_content('Add external Kata')
  end

  it 'can be added by an admin' do
    external_kata_name = 'External Kata name'
    external_kata_url = 'http://external-kata.com'
    log_in_admin

    visit root_path
    click_on('Add external Kata')
    fill_in(:name, with: external_kata_name)
    fill_in(:url, with: external_kata_url)
    click_on('Add external Kata')

    expect(page).to have_link(external_kata_name, href: external_kata_url)
  end
end
