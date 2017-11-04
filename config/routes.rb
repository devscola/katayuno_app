Rails.application.routes.draw do
  root to: 'katas#index'

  get '/index' => 'katas#index', as: :katas
  get '/show/kata/:id' => 'katas#show', as: :kata
  get '/new/kata' => 'katas#new', as: :new_kata
  post '/create/kata' => 'katas#create', as: :create_kata
end
