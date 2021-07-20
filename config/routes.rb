# frozen_string_literal: true

Rails.application.routes.draw do
  get 'products/:id/top_up', to: 'products#top_up', as: 'topup'
  get 'receipts/:id/send_mail', to: 'receipts#send_mail', as: 'send_mail'

  get :invoices, to: 'receipts#index', type: 'invoice'
  get :quotations, to: 'receipts#index', type: 'quotation'

  resources :receipts
  resources :products

  devise_for :users

  resources :customers
  resources :store, only: [:index]

  root 'store#index'
end
