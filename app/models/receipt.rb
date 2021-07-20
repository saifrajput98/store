class Receipt < ApplicationRecord
  RECEIPT_TYPE = {
    invoice: 'invoice',
    quotation: 'quotation'
  }.freeze

  belongs_to :customer
  has_many :line_items, dependent: :destroy
  accepts_nested_attributes_for :line_items, reject_if: :all_blank, allow_destroy: true

  validates :customer_id, :net_amt, :gross_amt, :receipt_type, presence: true

  enum receipt_type: RECEIPT_TYPE
  after_create :quantity_topup

  def self.search(term, type)
    # if search
    #   searched_type = Receipt.where(['receipt_type ILIKE ?', "%#{type}%"])
      
    #   searched_type.joins(:customer).where(['lower(customers.name) ILIKE ?', "%#{search.downcase}%"])
    # else
    #   all
    # end

    term = term&.downcase

    searched_type = Receipt.where(['receipt_type ILIKE ?', "%#{type}%"])
    searched_type = searched_type.joins(:customer).where(['lower(customers.name) ILIKE ?', "%#{term}%"]) if term.present?

    searched_type
  end

  def quantity_topup
    if self.invoice?
      self.line_items.each do |line_item|
        quant = line_item.product.quantity.to_i - lineItem.quantity.to_i
        product.update(quantity: quant)
      end
    end
  end
end
