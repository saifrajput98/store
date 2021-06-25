# frozen_string_literal: true

class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :name, null: false
      t.string :address, null: false
      t.string :contact1, null: false, unique: true
      t.string :contact2, unique: true
      t.string :email, null: false

      t.timestamps
    end
  end
end
