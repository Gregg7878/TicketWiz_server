class Customer < ApplicationRecord
    has_secure_password
    has_many :events  
    has_many :calendar_events 
    has_many :tickets   
end
