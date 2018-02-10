require 'rails_helper'

describe ExamplesController do
  context 'when no login' do
    it 'GET index returns ok' do
      kata = Kata.new(title: 'any', description: 'desc')
      kata.save

      get :index, params: { kata_id: kata.id }

      expect(response.code).to eq('200')
    end

    it 'POST create returns a redirection' do
      kata = Kata.new(title: 'any', description: 'desc')
      kata.save
      params = { kata_id: kata.id, text: 'Any', url: 'https://any.com' }

      post :create, params: params

      expect(response.code).to eq('302')
    end

    it 'DELETE destroy returns a redirection' do
      example = Example.new(kata: 1, text: 'any', url: 'https://any.com')
      example.save
      params = { id: example.id }

      delete :destroy, params: params

      expect(response.code).to eq('302')
    end

    it 'GET edit returns a redirection' do
      example = Example.new(kata: 1, text: 'any', url: 'https://any.com')
      example.save
      params = { id: example.id }

      get :edit, params: params

      expect(response.code).to eq('302')
    end

    it 'PATCH update returns a redirection' do
      example = Example.new(kata: 1, text: 'any', url: 'https://any.com')
      example.save
      params = { id: example.id }

      patch :update, params: params

      expect(response.code).to eq('302')
    end
  end

  context 'when user login' do
    before do
      @user = User.new(email: 'user@test.com', password: '12345678')
      @user.save
      sign_in(@user)
    end

    it 'GET index returns ok' do
      kata = Kata.new(title: 'any', description: 'desc')
      kata.save

      get :index, params: { kata_id: kata.id }

      expect(response.code).to eq('200')
    end

    it 'GET edit returns a redirection for user that doesnt belongs' do
      example = Example.new(text: 'Any', url: 'https://example.com', kata: 1, user: (@user.id + 1))
      example.save
      params = { id: example.id }

      get :edit, params: params

      expect(response.code).to eq('302')
    end

    it 'GET edit returns ok for user that belongs' do
      example = Example.new(text: 'Any', url: 'https://example.com', kata: 1, user: @user.id)
      example.save
      params = { id: example.id }

      get :edit, params: params

      expect(response.code).to eq('200')
    end

    it 'POST create returns a redirection' do
      kata = Kata.new(title: 'any', description: 'desc')
      kata.save
      example = Example.new(text: 'Any', url: 'https://example.com', kata: kata.id)
      example.save
      params = { kata_id: kata.id, text: 'New', url: 'https://new.com' }

      post :create, params: params

      expect(response.code).to eq('302')
    end

    it 'DELETE destroy returns a redirection' do
      example = Example.new(kata: 1, text: 'any', url: 'https://any.com')
      example.save
      params = { id: example.id }

      delete :destroy, params: params

      expect(response.code).to eq('302')
    end

    it 'GET edit returns ok' do
      example = Example.new(kata: 1, text: 'any', url: 'https://any.com', user: @user.id)
      example.save
      params = { id: example.id }

      get :edit, params: params

      expect(response.code).to eq('200')
    end

    it 'PATCH update returns a redirection' do
      example = Example.new(kata: 1, text: 'any', url: 'https://any.com')
      example.save
      params = { id: example.id, example: { text: 'text', url: example.url } }

      patch :update, params: params

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
      kata = Kata.new(title: 'any', description: 'desc')
      kata.save

      get :index, params: { kata_id: kata.id }

      expect(response.code).to eq('200')
    end

    it 'POST create returns a redirection' do
      kata = Kata.new(title: 'any', description: 'desc')
      kata.save
      example = Example.new(text: 'Any', url: 'https://example.com', kata: kata.id)
      example.save
      params = { kata_id: kata.id, text: 'New', url: 'https://new.com' }

      post :create, params: params

      expect(response.code).to eq('302')
    end

    it 'DELETE destroy returns a redirection' do
      example = Example.new(kata: 1, text: 'any', url: 'https://any.com')
      example.save
      params = { id: example.id }

      delete :destroy, params: params

      expect(response.code).to eq('302')
    end

    it 'GET edit returns ok' do
      example = Example.new(kata: 1, text: 'any', url: 'https://any.com')
      example.save
      params = { id: example.id }

      get :edit, params: params

      expect(response.code).to eq('200')
    end

    it 'PATCH update returns a redirection' do
      example = Example.new(kata: 1, text: 'any', url: 'https://any.com')
      example.save
      params = { id: example.id, example: { text: 'text', url: example.url } }

      patch :update, params: params

      expect(response.code).to eq('302')
    end
  end
end
