# frozen_string_literal: true

class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :title
      t.string :description
      t.numeric :unit_price
      t.string :quantity
      t.string :product_code

      t.timestamps
    end
  end
end
