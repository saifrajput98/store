# frozen_string_literal: true

module ReceiptsHelper
  def product_options
    Product.all.map do |product|
      [product.title, product.id, {
        'data-price': product.unit_price,
        class: "product-#{product.id}"
      }]
    end
  end
end
