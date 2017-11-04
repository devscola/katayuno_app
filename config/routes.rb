Rails.application.routes.draw do
  root to: 'katas#index'

  resources :katas
end
