# frozen_string_literal: true

class LineItem < ApplicationRecord
  belongs_to :product
  belongs_to :receipt

  validate :ensure_positive_quantity
  validate :ensure_lineitem_quantity
  validates :quantity, :price, :product_id, presence: true
  validates :discount, format: { with: /[0-9]/ }

  after_create :quantity_topup

  def quantity_topup
    if receipt.invoice?
      quant = product.quantity.to_i - quantity.to_i
      product.update(quantity: quant)
    end
  end

  def ensure_positive_quantity
    errors.add(:quantity, 'should be greater than 0.') if quantity.to_i <= 0
  end

  def ensure_lineitem_quantity
    errors.add(:quantity, 'Not in stock.') if product.quantity.to_i < quantity.to_i
  end
end
