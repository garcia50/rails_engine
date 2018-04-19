class Merchant < ApplicationRecord
  validates_presence_of :name

  has_many :items
  has_many :invoices
  has_many :transactions, through: :invoices
  has_many :customers,    through: :invoices

  def self.most_revenue(limit = 5)
    joins(invoices: [:transactions, :invoice_items])
    .group('merchants.id')
    .merge(Transaction.successful)
    .order('sum(invoice_items.quantity * invoice_items.unit_price) DESC')
    .take(limit)
  end

  def self.most_items(limit = 5)
    joins(invoices: [:transactions, :invoice_items])
    .group(:id)
    .merge(Transaction.successful)
    .order('sum(invoice_items.quantity) DESC')
    .take(limit)
  end

  def total_revenue
    successful_transactions = transactions.successful.includes(:invoice)
    trans = successful_transactions.reduce(0) do |sum, transaction|
      sum + transaction.invoice.total_amount
    end
    "The total revenue for this merchant is $#{trans.to_i/100.0}"
  end

  def favorite
    customers
      .joins(invoices: [:transactions])
      .merge(Transaction.successful)
      .group('customers.id')
      .order('count(invoices.*) desc')
      .first
  end

  def pending
    customers
    .joins("join transactions on transactions.invoice_id = invoices.id")
    .merge(Transaction.unsuccessful).distinct
  end

end
