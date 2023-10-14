class CalendarEvent < ApplicationRecord
  belongs_to :event
  belongs_to :customer
  belongs_to :organiser
end
