# frozen_string_literal: true

class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :address
      t.string :contact1
      t.string :contact2
      t.string :email

      t.timestamps
    end
  end
end
