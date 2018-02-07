require 'rails_helper'

describe KatasHelper do
  include Devise::Test::ControllerHelpers

  context '#delete_belt_button' do
    it 'returns nothing if non logged user' do
      belt_id = 1

      link = helper.delete_belt_button(belt_id)

      expect(link).to be_empty
    end

    it 'returns nothing if normal user is logged' do
      log_in_user
      belt_id = 1

      link = helper.delete_belt_button(belt_id)

      expect(link).to be_empty
    end

    it 'returns delete belt button if admin is logged' do
      log_in_admin
      belt_id = 1

      link = helper.delete_belt_button(belt_id)

      expect(link).to include('/delete')
    end
  end

  context '#edit_belt_button' do
    it 'returns nothing if non logged user' do
      belt_id = 1

      link = helper.edit_belt_button(belt_id)

      expect(link).to be_empty
    end

    it 'returns nothing if normal user is logged' do
      log_in_user
      belt_id = 1

      link = helper.edit_belt_button(belt_id)

      expect(link).to be_empty
    end

    it 'returns edit belt button if admin is logged' do
      log_in_admin
      belt_id = 1

      link = helper.edit_belt_button(belt_id)

      expect(link).to include('/edit')
    end
  end

  context '#add_kata_button' do
    it 'returns nothing if non logged user' do

      link = helper.add_kata_button

      expect(link).to be_empty
    end

    it 'returns nothing if normal user is logged' do
      log_in_user

      link = helper.add_kata_button

      expect(link).to be_empty
    end

    it 'returns add kata button if admin is logged' do
      log_in_admin

      link = helper.add_kata_button

      expect(link).to include('/katas/new')
    end
  end

  context '#edit_kata_button' do
    it 'returns nothing if non logged user' do
      kata_id = 1

      link = helper.edit_kata_button(kata_id)

      expect(link).to be_empty
    end

    it 'returns nothing if normal user is logged' do
      kata_id = 1
      log_in_user

      link = helper.edit_kata_button(kata_id)

      expect(link).to be_empty
    end

    it 'returns edit kata button if admin is logged' do
      kata_id = 1
      log_in_admin

      link = helper.edit_kata_button(kata_id)

      expect(link).to include('/edit')
    end
  end

  context '#delete_kata_button' do
    it 'returns nothing if non logged user' do
      kata_id = 1

      link = helper.delete_kata_button(kata_id)

      expect(link).to be_empty
    end

    it 'returns nothing if normal user is logged' do
      kata_id = 1
      log_in_user

      link = helper.delete_kata_button(kata_id)

      expect(link).to be_empty
    end

    it 'returns delete kata button if admin is logged' do
      kata_id = 1
      log_in_admin

      link = helper.delete_kata_button(kata_id)

      expect(link).to include('/katas')
      expect(link).to include('delete')
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
