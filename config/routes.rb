Rails.application.routes.draw do
  devise_for :users do
    get "/users/sign_out" , to:  "devise/sessions#destroy", :as => :destroy_user_session
  end
  resources :sales
  resources :clients
  resources :products
  # resources :products_clients
  resources :users
  # devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'dashboards#index'

  get '/statistics', to: 'statistics#index'
  # get '/users', to: 'users#index'
  # get '/users/:id/edit' ,to: 'users#edit', as: 'users_edit'
  # get '/users/:id' ,to: 'users#update', as: 'user_path'

end
