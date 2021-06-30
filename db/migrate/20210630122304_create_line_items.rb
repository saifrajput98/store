# frozen_string_literal: true

class CreateLineItems < ActiveRecord::Migration[5.2]
  def change
    create_table :line_items do |t|
      t.string :quantity
      t.numeric :price
      t.numeric :discount
      t.references :product, foreign_key: true
      t.references :receipt, foreign_key: true

      t.timestamps
    end
  end
end
