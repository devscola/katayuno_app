Rails.application.routes.draw do
  root to: 'katas#index'

  get '/index' => 'katas#index', as: :katas
  get '/show/kata/:id' => 'katas#show', as: :kata
end
