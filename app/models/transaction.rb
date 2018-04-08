class Transaction < ApplicationRecord
  validates_presence_of :result

  belongs_to :invoice

  scope :successful,   -> { where result: 'success' }
  scope :unsuccessful, -> { where result: 'failed' }
end