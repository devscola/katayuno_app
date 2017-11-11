require_relative 'helpers'
require 'rails_helper'
require 'capybara'

describe 'Admin' do
  before(:each) do
    log_in_admin
    create_user
  end

  it 'can view a list of users' do

    click_on('Admin Users')

    expect(page).to have_content('user@test.com')
    expect(page).to have_content('Become Admin')
    expect(page).to have_content('Delete')
    expect(page).to have_content('admin@test.com')
    expect(page).to have_content('Revoke Admin')
  end

  it 'can promote a user to admin' do

    click_on('Admin Users')
    click_on('Become Admin')

    expect(page).not_to have_content('Become Admin')
  end

  it 'can revoke admin to an admin' do

    click_on('Admin Users')
    click_on('Revoke Admin')

    expect(page).not_to have_content('Revoke Admin')
  end
end
