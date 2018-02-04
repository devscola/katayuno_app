Rails.application.routes.draw do
  devise_for :users
  root to: 'katas#index'

  get '/users' => 'users#index', as: :users
  patch '/become_admin/:id' => 'users#become_admin', as: :become_admin
  patch '/revoke_admin/:id' => 'users#revoke_admin', as: :revoke_admin
  delete '/user/:id/delete' => 'users#destroy', as: :delete_user

  resources :katas

  post '/belt/create/:kata_id' => 'belts#create', as: :belt
  delete '/belt/:id/delete' => 'belts#destroy', as: :delete_belt
  get '/belt/:id/edit' => 'belts#edit', as: :edit_belt
  patch '/belt/:id/update' => 'belts#update', as: :update_belt

  get '/examples/:kata_id' => 'examples#index', as: :examples
  post '/examples/create/:kata_id' => 'examples#create', as: :example
  delete '/examples/delete/:id' => 'examples#destroy', as: :delete_example
  get '/examples/edit/:id' => 'examples#edit', as: :edit_example
  patch '/examples/update/:id' => 'examples#update', as: :update_example

  post '/ping' => 'ping#ping', as: :ping
end
