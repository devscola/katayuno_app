require 'rails_helper'

describe ApplicationHelper do
  include Devise::Test::ControllerHelpers

  context '#session_actions' do
    it 'without logged user returns sign in link' do

      action = helper.session_actions

      expect(action).to include('sign_in')
    end

    it 'with logged user returns sign out link' do
      log_in_user

      action = helper.session_actions

      expect(action).to include('sign_out')
    end
  end

  context '#logged_user' do
    it 'without logged user returns an empty email' do

      user_email = helper.logged_user

      expect(user_email).to be_empty
    end

    it 'with logged user returns its email' do
      email = 'user@test.com'
      log_in_user(email)

      user_email = helper.logged_user

      expect(user_email).to eq(email)
    end
  end

  context '#admin_users' do
    it 'returns nothing without logged user' do

      link = helper.admin_users

      expect(link).to be_empty
    end

    it 'returns nothing with logged user' do
      log_in_user

      link = helper.admin_users

      expect(link).to be_empty
    end

    it 'returns admin user link for logged admin' do
      admin = User.new(email: 'admin@test.com', password: '12345678', admin: true)
      admin.save
      sign_in(admin)

      link = helper.admin_users

      expect(link).to include('/users')
    end
  end

  def log_in_user(email='user@test.com')
    user = User.new(email: email, password: '12345678')
    user.save
    sign_in(user)
  end
end
