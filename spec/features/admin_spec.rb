require_relative 'helpers'
require 'rails_helper'
require 'capybara'

describe 'Admin' do
  context 'when an admin is logged' do
    before(:each) do
      log_in_admin
      @user = create_user
    end

    it 'can view a list of users' do

      click_on(admin_users_text)

      expect(page).to have_content('user@test.com')
      expect(page).to have_content('Become Admin')
      expect(page).to have_content('Delete')
      expect(page).to have_content('admin@test.com')
      expect(page).to have_content('Revoke Admin')
    end

    it 'can promote a user to admin' do

      click_on(admin_users_text)
      click_on('Become Admin')

      expect(page).not_to have_content('Become Admin')
    end

    it 'can revoke admin to an admin' do

      click_on(admin_users_text)
      click_on('Revoke Admin')

      expect(page).not_to have_content('Revoke Admin')
    end

    it 'can delete an user' do
      url = "/users/#{@user.id}"

      click_on(admin_users_text)
      find(:xpath, "//a[@href='#{url}']").click

      expect(page).not_to have_content(@user.email)
    end
  end

  context 'when user is not logged' do
    it 'cannot admin users' do

      visit '/'

      expect(page).to have_content('Kata-logue')
      expect(page).not_to have_content(admin_users_text)
    end
  end

  context 'when a user is logged' do
    before do
      log_in_user
    end

    it 'cannot admin users' do

      visit '/'

      expect(page).to have_content('Kata-logue')
      expect(page).not_to have_content(admin_users_text)
    end
  end

  def admin_users_text
    I18n.t(:admin_users)
  end
end
