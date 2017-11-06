require 'rails_helper'
require 'capybara'

describe 'User' do
  it 'can do log in' do
    user_email = 'user@test.com'
    user_password = '12345678'
    user = User.new(
      email: user_email,
      password: user_password,
      password_confirmation: user_password
    )
    user.save

    visit root_path
    click_on('Log in')
    fill_in(:user_email, with: user_email)
    fill_in(:user_password, with: user_password)
    find('input[name="commit"]').click

    expect(page).to have_content('Log out')
    expect(page).to have_content(user_email)
  end
end
