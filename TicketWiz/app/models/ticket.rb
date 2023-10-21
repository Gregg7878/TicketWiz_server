class Ticket < ApplicationRecord
  belongs_to :event
  belongs_to :customer

  enum ticket_type: { 'MVP' => 'MVP', 'Early Booking' => 'Early Booking', 'Regular' => 'Regular' }
  validates :ticket_type, presence: { message: "must be provided" }, inclusion: { in: %w(MVP Early\ Booking Regular), message: "is not a valid ticket type" }
  validates :quantity, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }

  after_create :reduce_available_tickets_count

  def calculate_price
    base_price = case ticket_type
                 when 'MVP'
                   event.price * 1.3
                 when 'Early Booking'
                   event.price * 0.8
                 when 'Regular'
                   event.price
                 else
                   event.price
                 end

    base_price
  end
 
  private

  def reduce_available_tickets_count
    event = self.event
    event.with_lock do
      if event.available_tickets_count > 0
        event.available_tickets_count -= quantity
        event.save
      end
    end
  end
end
