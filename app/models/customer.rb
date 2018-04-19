class Customer < ApplicationRecord
  validates_presence_of :first_name
  validates_presence_of :last_name

  has_many   :invoices
  has_many   :merchants, through: :invoices
  has_many   :transactions, through: :invoices

  def most_transactions
    transactions
  end

  def favorite
    joins(:invoices [:transactions])
    .group
  end
end
