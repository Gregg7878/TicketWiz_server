class Organiser < ApplicationRecord
    has_secure_password
    has_many :events, dependent: :destroy
    has_many :calendar_events,  dependent: :destroy

    validate :password_complexity
    validates :phone_number, presence: true, format: { with: /\A\d{10}\z/, message: "should be a 10-digit number" }
    validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP } 
    validates :age, presence: true, numericality: { greater_than_or_equal_to: 18 }
    validates :first_name, presence: true
    validates :last_name, presence: true 

    private

    def password_complexity
        unless password.match(/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*\.).{6,}$/)
          errors.add(:password, "must include at least one lowercase letter, one uppercase letter, one digit, one period, and be at least 6 characters long.")
        end
    end
end
