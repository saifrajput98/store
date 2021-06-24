# frozen_string_literal: true

Rails.application.routes.draw do
  resources :products
  get 'customers/index'
  get 'store/index'

  devise_for :users

  resources :customers

  root 'store#index'
end
