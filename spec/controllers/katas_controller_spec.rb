require 'rails_helper'

describe KatasController, type: :controller do
  context 'without admin' do
    it 'can access to index' do

      get :index

      expect(response.status).to eq(200)
    end

    it 'cannot access to new' do

      get :new

      expect(response.status).to eq(302)
    end

    it 'cannot access to create' do

      post :create

      expect(response.status).to eq(302)
    end

    xit 'cannot access to edit' do
      kata = Kata.new(
        title: 'Kata title',
        description: 'Kata description'
      )
      kata.save

      get edit_kata_path(kata.id)

      expect(response.status).to eq(302)
    end

    xit 'cannot access to update' do

      patch :update

      expect(response.status).to eq(302)
    end

    xit 'cannot access to destroy' do

      delete :destroy

      expect(response.status).to eq(302)
    end
  end
end
