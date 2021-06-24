# frozen_string_literal: true

class Product < ApplicationRecord
  validates :title, :description, :unit_price, :quantity, :product_code, presence: true
  validates :title, uniqueness: true
  validates :title, format: { with: /[a-zA-Z]/, message: 'only allows letters' }
  validate :min_quantity

  def min_quantity
    errors.add(:quantity, "can't be less than 0") if quantity.to_i <= 0
  end
end
