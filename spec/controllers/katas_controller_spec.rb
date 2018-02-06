require 'rails_helper'

describe KatasController do
  context 'when no login' do
    it 'GET index returns ok' do

      get :index

      expect(response.code).to eq('200')
    end

    it 'GET show returns ok' do
      kata = Kata.new(title: 'any', description: 'desc')
      kata.save

      get :show, params: { id: kata.id }

      expect(response.code).to eq('200')
    end

    it 'GET new returns ok' do

      get :new

      expect(response.code).to eq('302')
    end

    it 'POST create returns a redirect' do

      post :create, params: {}

      expect(response.code).to eq('302')
    end

    it 'GET edit returns a redirect' do
      kata = Kata.new(title: 'any', description: 'desc')
      kata.save

      get :edit, params: { id: kata.id }

      expect(response.code).to eq('302')
    end

    it 'PATCH update returns a redirect' do
      kata = Kata.new(title: 'any', description: 'desc')
      kata.save

      patch :update, params: { id: kata.id }

      expect(response.code).to eq('302')
    end

    it 'DELETE destroy returns a redirect' do
      kata = Kata.new(title: 'any', description: 'desc')
      kata.save

      delete :destroy, params: { id: kata.id }

      expect(response.code).to eq('302')
    end
  end

  context 'when user login' do

    before do
      user = User.new(email: 'user@test.com', password: '12345678')
      user.save
      sign_in(user)
    end

    it 'GET index returns ok' do

      get :index

      expect(response.code).to eq('200')
    end

    it 'GET show returns ok' do
      kata = Kata.new(title: 'any', description: 'desc')
      kata.save

      get :show, params: { id: kata.id }

      expect(response.code).to eq('200')
    end

    it 'GET new returns ok' do

      get :new

      expect(response.code).to eq('302')
    end

    it 'POST create returns a redirect' do

      post :create, params: {}

      expect(response.code).to eq('302')
    end

    it 'GET edit returns a redirect' do
      kata = Kata.new(title: 'any', description: 'desc')
      kata.save

      get :edit, params: { id: kata.id }

      expect(response.code).to eq('302')
    end

    it 'PATCH update returns a redirect' do
      kata = Kata.new(title: 'any', description: 'desc')
      kata.save

      patch :update, params: { id: kata.id }

      expect(response.code).to eq('302')
    end

    it 'DELETE destroy returns a redirect' do
      kata = Kata.new(title: 'any', description: 'desc')
      kata.save

      delete :destroy, params: { id: kata.id }

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

    it 'GET show returns ok' do
      kata = Kata.new(title: 'any', description: 'desc')
      kata.save

      get :show, params: { id: kata.id }

      expect(response.code).to eq('200')
    end

    it 'GET new returns ok' do

      get :new

      expect(response.code).to eq('200')
    end

    it 'POST create returns a redirect' do
      kata = Kata.new(title: 'any', description: 'desc')
      kata.save

      post :create, params: { kata: { title: 'new', description: 'new' } }

      expect(response.code).to eq('302')
    end

    it 'GET edit returns a redirect' do
      kata = Kata.new(title: 'any', description: 'desc')
      kata.save

      get :edit, params: { id: kata.id }

      expect(response.code).to eq('200')
    end

    it 'PATCH update returns a redirect' do
      kata = Kata.new(title: 'any', description: 'desc')
      kata.save

      patch :update, params: { id: kata.id, kata: { title: 'new', description: 'new' } }

      expect(response.code).to eq('302')
    end

    it 'DELETE destroy returns a redirect' do
      kata = Kata.new(title: 'any', description: 'desc')
      kata.save

      delete :destroy, params: { id: kata.id }

      expect(response.code).to eq('302')
    end
  end
end
