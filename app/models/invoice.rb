class Invoice < ApplicationRecord
  belongs_to :merchant
  belongs_to :customer

  has_many :invoice_items
  has_many :transactions

  def total_amount
    invoice_items.reduce(0) do |sum, item|
      sum + item.unit_price
    end
  end
  
end
