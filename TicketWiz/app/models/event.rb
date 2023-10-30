class Event < ApplicationRecord
  belongs_to :organiser
  has_many :tickets, dependent: :destroy

  CATEGORIES = ['Conferences', 'Workshops and Seminars', 'Networking Events', 'Trade Shows', 'Concerts', 'Sporting Events', 'Art Shows', 'Feast Event', 'Performing Arts', 'Charity Events', 'Parties', 'Educational Events', 'Tech and Hackathons', 'Adventure', 'Cultural', 'Virtual', 'Cosplay', 'Gaming']
 # Validations
   validates :category, inclusion: { in: CATEGORIES, message: "is not a valid category" }
   validates :title, presence: true
   validates :date, presence: true
   validates :start_time, presence: true
   validates :end_time, presence: true
   validate :date_must_be_in_future
   validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
 
   def date_must_be_in_future
    if date.present? && date <= Date.current
      errors.add(:date, 'must be in the future and not today')
    end
  end

end
