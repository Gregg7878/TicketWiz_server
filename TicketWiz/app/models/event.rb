class Event < ApplicationRecord
  belongs_to :organiser
  has_many :tickets

  
   # Validations
   #validates :title, presence: true
   #validates :date, presence: true
   #validates :start_time, presence: true
   #validates :end_time, presence: true
   #validates :date, date: { after_or_equal_to: -> { Date.current }, message: 'must be in the future' }

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
    #"Gaming"
  #]

  #validates :category, inclusion: { in: CATEGORIES }

  end
