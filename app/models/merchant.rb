class Merchant < ApplicationRecord
  validates_presence_of :name

  has_many :items
  has_many :invoices

  has_many :transactions, through: :invoices

  def total_revenue
    successful_transactions = transactions.successful.includes(:invoice)
    trans = successful_transactions.reduce(0) do |sum, transaction|
      sum + transaction.invoice.total_amount
    end
    "The total revenue for this merchant is $#{trans}"
  end

  def item_collection 
    items
  end

  def invoice_collection 
    invoices
  end

  def self.search(params)
    find_by(params)
  end

end
