# frozen_string_literal: true

Rails.application.routes.draw do
  resources :receipts
  resources :products

  devise_for :users

  resources :customers
  resources :store, only: [:index]

  root 'store#index'
end
