require 'rails_helper'

describe ExamplesHelper do
  include Devise::Test::ControllerHelpers

  context '#edit_example' do
    it 'returns nothing for non logged user' do
      example_id = 1

      link = helper.edit_example(example_id)

      expect(link).to be_empty
    end

    it 'returns nothing for example that belongs to other user' do
      user = log_in_user
      another_user_id = user.id + 1
      example = Example.new(
        kata: 1,
        text: 'any',
        url: 'https://any.com',
        user: another_user_id
      )
      example.save

      link = helper.edit_example(example.id)

      expect(link).to be_empty
    end

    it 'returns edit example link for example that belongs to user' do
      user = log_in_user
      example = Example.new(
        kata: 1,
        text: 'any',
        url: 'https://any.com',
        user: user.id
      )
      example.save

      link = helper.edit_example(example.id)

      expect(link).to include('/examples/edit')
    end

    it 'returns edit example link for logged admin' do
      log_in_admin
      example = Example.new(
        kata: 1,
        text: 'any',
        url: 'https://any.com'
      )
      example.save

      link = helper.edit_example(example.id)

      expect(link).to include('/examples/edit')
    end
  end

  context '#delete_example' do
    it 'returns nothing for non logged user' do
      example_id = 1
      user_id = 1

      link = helper.edit_example(example_id)

      expect(link).to be_empty
    end

    it 'returns nothing for example that belongs to other user' do
      user = log_in_user
      another_user_id = user.id + 1
      example = Example.new(
        kata: 1,
        text: 'any',
        url: 'https://any.com',
        user: another_user_id
      )
      example.save

      link = helper.delete_example(example.id)

      expect(link).to be_empty
    end

    it 'returns delete example link for example that belongs to user' do
      user = log_in_user
      example = Example.new(
        kata: 1,
        text: 'any',
        url: 'https://any.com',
        user: user.id
      )
      example.save

      link = helper.delete_example(example.id)

      expect(link).to include('/examples/delete')
    end

    it 'returns delete example link for logged admin' do
      log_in_admin
      example = Example.new(
        kata: 1,
        text: 'any',
        url: 'https://any.com'
      )
      example.save

      link = helper.delete_example(example.id)

      expect(link).to include('/examples/delete')
    end
  end

  def log_in_user(email='user@test.com')
    user = User.new(email: email, password: '12345678')
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
