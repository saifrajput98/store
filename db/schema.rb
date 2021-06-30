# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_210_630_122_304) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'customers', force: :cascade do |t|
    t.string 'name', null: false
    t.string 'address', null: false
    t.string 'contact1', null: false
    t.string 'contact2'
    t.string 'email', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'line_items', force: :cascade do |t|
    t.string 'quantity'
    t.decimal 'price'
    t.decimal 'discount'
    t.bigint 'product_id'
    t.bigint 'receipt_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['product_id'], name: 'index_line_items_on_product_id'
    t.index ['receipt_id'], name: 'index_line_items_on_receipt_id'
  end

  create_table 'products', force: :cascade do |t|
    t.string 'title', null: false
    t.string 'description', null: false
    t.decimal 'unit_price', null: false
    t.string 'quantity', null: false
    t.string 'product_code', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'receipts', force: :cascade do |t|
    t.decimal 'net_amt'
    t.decimal 'gross_amt'
    t.decimal 'discount_amt'
    t.string 'receipt_type'
    t.bigint 'customer_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['customer_id'], name: 'index_receipts_on_customer_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'first_name', null: false
    t.string 'last_name', null: false
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.integer 'failed_attempts', default: 0, null: false
    t.string 'unlock_token'
    t.datetime 'locked_at'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end

  add_foreign_key 'line_items', 'products'
  add_foreign_key 'line_items', 'receipts'
  add_foreign_key 'receipts', 'customers'
end
