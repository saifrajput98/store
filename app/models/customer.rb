# frozen_string_literal: true

class Customer < ApplicationRecord
  validates :name, :address, :contact1, :email, presence: true
  validates :contact1, :contact2, :email, uniqueness: true
  validates :name, format: { with: /[a-zA-Z]/, message: 'only alphabets' }
  validates :contact1, :contact2, telephone_number: { country: proc {
                                                                 :pk
                                                               }, types: %i[mobile], message: 'Contact should contain 11 digits' }
  validates :email, email: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }

  def self.search(term)
    customers = all
    customers = customers.where('lower(name) ILIKE ?',"%#{term}%") if term&.downcase.present?
    customers
  end
end
