class Event < ApplicationRecord
  belongs_to :organiser
  has_many :tickets

   # Validations
   validates :title, presence: true
   validates :date, presence: true
   validates :start_time, presence: true
   validates :end_time, presence: true
   validates :date, date: { after_or_equal_to: -> { Date.current }, message: 'must be in the future' }
end
