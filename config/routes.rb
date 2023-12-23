Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  resources :ratings
  resources :paymentmethods
  resources :ordersdetails
  resources :orders
  resources :genres
  resources :employees
  resources :customers
  resources :books
  resources :authors
  # get 'home/index'
  get 'home/about'

  root 'home#index'
end