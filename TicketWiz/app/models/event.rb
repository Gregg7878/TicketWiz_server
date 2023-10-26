class Event < ApplicationRecord
  belongs_to :organiser
  has_many :tickets

  CATEGORIES = [
    "Conferences",
    "Workshops and Seminars",
    "Networking Events",
    "Trade Shows",
    "Concerts and Music Festivals",
    "Sporting Events",
    "Art Exhibitions and Galleries",
    "Food and Beverage Events",
    "Theater and Performing Arts",
    "Community and Charity Events",
    "Parties",
    "Educational Events",
    "Tech and Hackathons",
    "Adventure Activities",
    "Cultural",
    "Virtual",
    "Cosplay",
    "Gaming"
  ]

  
   # Validations
   #validates :title, presence: true
   #validates :date, presence: true
   #validates :start_time, presence: true
   validates :end_time, presence: true
   validate :date_must_be_in_future
   validates :date, date: { after_or_equal_to: -> { Date.current }, message: 'must be in the future' }
   validates :category, inclusion: { in: CATEGORIES }

  end

   private
 
   def date_must_be_in_future
     if date.present? && date <= Date.current
       errors.add(:date, 'must be in the future')
     end
   end
end
