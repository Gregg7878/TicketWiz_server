class Organiser < ApplicationRecord
    has_secure_password
    has_many :events, dependent: :destroy
    has_many :calendar_events,  dependent: :destroy

    validate :password_complexity
    validates :phone_number, presence: true, format: { with: /\A(254)\d{9}\z/, message: "should start with '254' followed by 9 digits" }
    validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP } 
    validates :age, presence: true, numericality: { greater_than_or_equal_to: 18 }
    validates :first_name, presence: true
    validates :last_name, presence: true 

    private

    def password_complexity
      unless password.match(/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{6,}$/)
        errors.add(:password, "must include at least one uppercase letter, one lowercase letter, one digit, and be at least 6 characters long.")
      end
    end
end
