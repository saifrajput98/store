# frozen_string_literal: true

class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :title, null: false
      t.string :description, null: false
      t.numeric :unit_price, null: false
      t.string :quantity, null: false
      t.string :product_code, null: false

      t.timestamps
    end
  end
end
