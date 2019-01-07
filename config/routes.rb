Rails.application.routes.draw do
  resources :sales
  resources :clients
  resources :products
  resources :products_clients
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'dashboards#index'
end
