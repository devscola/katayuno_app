require_relative 'helpers'
require 'rails_helper'
require 'capybara'

describe 'Admin' do
  it 'can view a list of users' do
    log_in_admin
    user = User.new(
      email: 'user@test.com',
      password: '12345678',
      password_confirmation: '12345678'
    )
    user.save

    click_on('Admin Users')

    expect(page).to have_content('user@test.com')
    expect(page).to have_content('Become Admin')
    expect(page).to have_content('Delete')
    expect(page).to have_content('admin@test.com')
    expect(page).to have_content('Revoke Admin')
  end
end
