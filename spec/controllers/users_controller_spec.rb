require 'rails_helper'

describe UsersController do
  context 'when no login' do
    it 'GET index returns a redirection' do

      get :index

      expect(response.code).to eq('302')
    end

    it 'PATCH become_admin returns a redirection' do

      patch :become_admin, params: { id: 1 }

      expect(response.code).to eq('302')
    end

    it 'PATCH revoke_admin returns a redirection' do

      patch :revoke_admin, params: { id: 1 }

      expect(response.code).to eq('302')
    end

    it 'DELETE destroy returns a redirection' do

      delete :destroy, params: { id: 1 }

      expect(response.code).to eq('302')
    end
  end

  context 'when user login' do
    before do
      user = User.new(email: 'user@test.com', password: '12345678')
      user.save
      sign_in(user)
    end

    it 'GET index returns a redirection' do

      get :index

      expect(response.code).to eq('302')
    end

    it 'PATCH become_admin returns a redirection' do

      patch :become_admin, params: { id: 1 }

      expect(response.code).to eq('302')
    end

    it 'PATCH revoke_admin returns a redirection' do

      patch :revoke_admin, params: { id: 1 }

      expect(response.code).to eq('302')
    end

    it 'DELETE destroy returns a redirection' do

      delete :destroy, params: { id: 1 }

      expect(response.code).to eq('302')
    end
  end

  context 'when admin login' do
    before do
      admin = User.new(email: 'admin@test.com', password: '12345678', admin: true)
      admin.save
      sign_in(admin)
    end

    it 'GET index returns ok' do

      get :index

      expect(response.code).to eq('200')
    end

    it 'PATCH become_admin returns a redirection' do

      patch :become_admin, params: { id: 1 }

      expect(response.code).to eq('302')
    end

    it 'PATCH revoke_admin returns a redirection' do

      patch :revoke_admin, params: { id: 1 }

      expect(response.code).to eq('302')
    end

    it 'DELETE destroy returns a redirection' do

      delete :destroy, params: { id: 1 }

      expect(response.code).to eq('302')
    end
  end
end
