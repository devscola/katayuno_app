require 'rails_helper'

describe BeltsController do
  context 'when no login' do
    it 'POST create returns redirect' do
      params = { kata_id: 1 }

      post :create, params: params

      expect(response.code).to eq('302')
    end

    it 'DELETE destroy returns redirect' do
      params = { id: 1 }

      delete :destroy, params: params

      expect(response.code).to eq('302')
    end

    it 'GET edit returns redirect' do
      params = { id: 1 }

      get :edit, params: params

      expect(response.code).to eq('302')
    end

    it 'PATCH update returns redirect' do
      params = { id: 1 }

      patch :update, params: params

      expect(response.code).to eq('302')
    end
  end

  context 'when non-admin' do

    before do
      user = User.new(email: 'user@test.com', password: '12345678')
      user.save
      sign_in(user)
    end

    it 'POST create returns redirect' do
      params = { kata_id: 1 }

      post :create, params: params

      expect(response.code).to eq('302')
    end

    it 'DELETE destroy returns redirect' do
      params = { id: 1 }

      delete :destroy, params: params

      expect(response.code).to eq('302')
    end

    it 'GET edit returns redirect' do
      params = { id: 1 }

      get :edit, params: params

      expect(response.code).to eq('302')
    end

    it 'PATCH update returns redirect' do
      params = { id: 1 }

      patch :update, params: params

      expect(response.code).to eq('302')
    end
  end

  context 'when admin is logged' do

    before do
      admin = User.new(email: 'admin@test.com', password: '12345678', admin: true)
      admin.save
      sign_in(admin)
    end

    it 'POST create returns redirect' do
      params = { kata_id: 1 }

      post :create, params: params

      expect(response.code).to eq('302')
    end

    it 'DELETE destroy returns redirect' do
      belt = Belt.new(name: 'name', description: 'desc', kata: 1)
      belt.save
      params = { id: belt.id }

      delete :destroy, params: params

      expect(response.code).to eq('302')
    end

    it 'GET edit returns ok' do
      belt = Belt.new(name: 'name', description: 'desc', kata: 1)
      belt.save
      params = { id: belt.id }

      get :edit, params: params

      expect(response.code).to eq('200')
    end

    it 'PATCH update returns redirect' do
      belt = Belt.new(name: 'name', description: 'desc', kata: 1)
      belt.save
      params = { id: belt.id }

      patch :update, params: params

      expect(response.code).to eq('302')
    end
  end
end
