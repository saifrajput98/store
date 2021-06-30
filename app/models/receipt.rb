# frozen_string_literal: true

class Receipt < ApplicationRecord
  belongs_to :customer
  has_many :line_items
  accepts_nested_attributes_for :line_items, reject_if: :all_blank, allow_destroy: true

  def self.search(search)
    if search
      Receipt.joins(:customer).where(['lower(customers.name) ILIKE ?', "%#{search.downcase}%"])
    else
      all
    end
  end
end
