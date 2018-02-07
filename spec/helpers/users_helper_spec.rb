require 'rails_helper'

describe UsersHelper do
  include Devise::Test::ControllerHelpers

  context '#handle_admin' do
    before(:each) do
      @user = User.new(email: 'user@test.com', password: '12345678')
      @user.save
    end

    it 'returns nothing for a non user logged' do

      link = helper.handle_admin(@user)

      expect(link).to be_empty
    end

    it 'returns nothing for a normal user logged' do
      log_in_user

      link = helper.handle_admin(@user)

      expect(link).to be_empty
    end

    it 'returns become admin link for admin user logged' do
      log_in_admin

      link = helper.handle_admin(@user)

      expect(link).to include('/become_admin')
    end

    it 'returns revoke admin link for admin user logged when the user admin' do
      log_in_admin
      @user.update(admin: true)

      link = helper.handle_admin(@user)

      expect(link).to include('/revoke_admin')
    end
  end

  def log_in_user
    user = User.new(email: 'user@test.com', password: '12345678')
    user.save
    sign_in(user)

    user
  end

  def log_in_admin
    admin = User.new(email: 'admin@test.com', password: '12345678', admin: true)
    admin.save
    sign_in(admin)

    admin
  end
end
