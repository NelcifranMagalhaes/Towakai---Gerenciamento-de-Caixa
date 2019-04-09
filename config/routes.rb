Rails.application.routes.draw do
  resources :product_specifications
  resources :payment_types
  resources :status_sales
  resources :client_types
  resources :product_types
  devise_for :users
  resources :sales
  resources :clients
  resources :products
  # resources :products_clients
  resources :users,only:[:edit, :update, :index]
  # devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'dashboards#index'

  get '/statistics', to: 'statistics#index'
  get '/balance', to: 'statistics#balance'
  post '/balance', to: 'statistics#balance'
  # get '/users', to: 'users#index'
  # get '/users/:id/edit' ,to: 'users#edit', as: 'users_edit'
  # get '/users/:id' ,to: 'users#update', as: 'user_path'

end
