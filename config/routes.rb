Rails.application.routes.draw do
  devise_for :users
  root to: 'katas#index'

  resources :katas
end
