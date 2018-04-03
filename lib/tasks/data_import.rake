
namespace :db do
  desc "import csv data into db"
  task import: :environment do
    data_models = [
      Customer,
      Merchant,
      Item,
      Invoice,
      InvoiceItem,
      Transaction
    ]
    
