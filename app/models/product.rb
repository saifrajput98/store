# frozen_string_literal: true

class Product < ApplicationRecord
  has_one_attached :image

  validates :title, :description, :unit_price, :quantity, :product_code, presence: true
  validates :title, :product_code, uniqueness: true
  validates :title, format: { with: /[a-zA-Z]/, message: 'only allow letters.' }
  validate :ensure_positive_quantity

  def ensure_positive_quantity
    errors.add(:quantity, 'should be greater than 0.') if quantity.to_i <= 0
  end

  def self.search(term)
    term = term&.downcase

    products = all
    products = products.where('lower(title) ILIKE ?',
             "%#{term}%").or where('lower(product_code) ILIKE ?', "%#{term}%") if term.present?
    products
  end
end
