class Event < ApplicationRecord
  belongs_to :organiser
  has_many :tickets, dependent: :destroy

  CATEGORIES = ['Conferences', 'Workshops and Seminars', 'Networking Events', 'Trade Shows', 'Concerts', 'Sporting Events', 'Art Shows', 'Feast Event', 'Performing Arts', 'Charity Events', 'Parties', 'Educational Events', 'Tech and Hackathons', 'Adventure', 'Cultural', 'Virtual', 'Cosplay', 'Gaming']

  validates :category, inclusion: { in: CATEGORIES, message: "is not a valid category" }

  
   # Validations
   validates :title, presence: true
   validates :date, presence: true
   validates :start_time, presence: true
   validates :end_time, presence: true
   validates :date, date: { after_or_equal_to: -> { Date.current }, message: 'must be in the future' }
end
