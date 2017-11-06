require 'rails_helper'
require 'capybara'

describe 'User' do
  before do
    @user = User.new(
      email: 'user@test.com',
      password: '12345678',
      password_confirmation: '12345678'
    )
    @user.save
  end

  it 'can do log in' do
    visit root_path
    click_on('Log in')
    fill_in(:user_email, with: @user.email)
    fill_in(:user_password, with: @user.password)

    click_on_log_in_form

    expect(page).to have_content('Log out')
    expect(page).to have_content(@user.email)
  end

  it 'can do log out' do
    visit root_path
    click_on('Log in')
    fill_in(:user_email, with: @user.email)
    fill_in(:user_password, with: @user.password)
    click_on_log_in_form

    click_on('Log out')

    expect(page).to have_content('Log in')
    expect(page).not_to have_content(@user.email)
    expect(page).not_to have_content('Log out')
  end

  def click_on_log_in_form
    find('input[name="commit"]').click
  end
end
