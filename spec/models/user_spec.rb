require 'rails_helper'

describe 'User' do
  it 'is created as without admin' do
    user = User.new(
      email: 'normal@user.com',
      password: password,
      password_confirmation: password
    )

    user.save

    expect(user.admin?).to eq(false)
  end

  it 'can become admin' do
    user = User.new(
      email: 'admin@user.com',
      password: password,
      password_confirmation: password
    )
    user.save

    user.become_admin

    expect(user.admin?).to eq(true)
  end

  it 'can lose its admin' do
    user = User.new(
      email: 'admin@user.com',
      password: password,
      password_confirmation: password
    )
    user.save
    user.become_admin

    user.revoke_admin

    expect(user.admin?).to eq(false)
  end

  def password
    '12345678'
  end
end
