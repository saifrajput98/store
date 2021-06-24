# frozen_string_literal: true

json.extract! product, :id, :title, :description, :unit_price, :quantity, :product_code, :created_at, :updated_at
json.url product_url(product, format: :json)
