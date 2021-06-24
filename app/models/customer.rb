# frozen_string_literal: true

class Customer < ApplicationRecord
  validates :name, :address, :contact1, :email, presence: true
  validates :contact1, :contact2, :email, presence: true, uniqueness: true
  validates :name, format: { with: /[a-zA-Z]/, message: 'only allows letters' }
  validates :contact1, :contact2, telephone_number: { country: proc {
                                                                 :pk
                                                               }, types: %i[mobile fixed_line], message: 'Contact should contain 11 numbers' }
  validates :email, email: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
end
