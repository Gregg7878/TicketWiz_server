class Payment < ApplicationRecord
  belongs_to :ticket

  
  # Validations
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :status, presence: true, inclusion: { in: %w(pending completed failed) }
  validates :transaction_id, presence: true, uniqueness: true, length: { is: 36 }

  before_create :generate_transaction_id
  before_save :calculate_amount

  def calculate_amount
    ticket = self.ticket
    self.amount = ticket.calculate_price * ticket.quantity
  end

  def set_as_completed
    self.status = 'completed'
    save
  end

  def set_as_failed
    self.status = 'failed'
    save
  end

  private

  def generate_transaction_id
    self.transaction_id = SecureRandom.uuid
  end

end
