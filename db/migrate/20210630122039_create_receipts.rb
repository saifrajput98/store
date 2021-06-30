# frozen_string_literal: true

class CreateReceipts < ActiveRecord::Migration[5.2]
  def change
    create_table :receipts do |t|
      t.numeric :net_amt
      t.numeric :gross_amt
      t.numeric :discount_amt
      t.string :receipt_type
      t.references :customer, foreign_key: true

      t.timestamps
    end
  end
end
