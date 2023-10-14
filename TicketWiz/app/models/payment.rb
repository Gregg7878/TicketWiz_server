class Payment < ApplicationRecord
  belongs_to :ticket

  # Validations
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :transaction_id, presence: true, uniqueness: true
  validates :status, presence: true, inclusion: { in: %w(pending completed failed) }
  
end
