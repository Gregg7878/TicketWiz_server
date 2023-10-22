class Booking < ApplicationRecord
    belongs_to :customer
    has_many :payment
  end
  