require 'csv'

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
    
    data_models.each do |model|
      filename = "#{model.to_s.parameterize}.csv"
      path = File.join(Rails.root, "db", "data", filename)
      count = 0

      CSV.foreach(path, headers: true) do |row|
        model.create(row.to_h)
        count += 1
      end
      puts "Saved #{count} #{model} records in the database."
    end
  end
end