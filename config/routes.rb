Rails.application.routes.draw do
  devise_for :users
  root to: 'katas#index'

  get '/users' => 'users#index', as: :users
  patch '/become_admin/:id' => 'users#become_admin', as: :become_admin
  patch '/revoke_admin/:id' => 'users#revoke_admin', as: :revoke_admin
  delete '/users/:id' => 'users#destroy', as: :destroy_user

  resources :katas

  post '/belts/:kata_id' => 'belts#create', as: :belt
  delete '/belts/:id' => 'belts#destroy', as: :destroy_belt
  get '/belts/:id' => 'belts#edit', as: :edit_belt
  patch '/belts/:id' => 'belts#update', as: :update_belt

  get '/examples/:kata_id' => 'examples#index', as: :examples
  post '/examples/:kata_id' => 'examples#create', as: :example
  delete '/examples/:id' => 'examples#destroy', as: :destroy_example
  get '/examples/edit/:id' => 'examples#edit', as: :edit_example
  patch '/examples/:id' => 'examples#update', as: :update_example

  post '/ping' => 'ping#ping', as: :ping
end
