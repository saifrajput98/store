# frozen_string_literal: true

class Product < ApplicationRecord
  validates :title, :description, :unit_price, :quantity, :product_code, presence: true
  validates :title, uniqueness: true
  validates :title, format: { with: /[a-zA-Z]/, message: 'only allows letters' }
  validate :ensure_positive_quantity

  def ensure_positive_quantity
    errors.add(:quantity, 'should be greater than 0') if quantity.to_i <= 0
  end

  def self.search(search)
    if search
      where(['lower(title) ILIKE ?',
             "%#{search.downcase}%"]).or where(['lower(product_code) ILIKE ?', "%#{search.downcase}%"])
    else
      all
    end
  end
end
