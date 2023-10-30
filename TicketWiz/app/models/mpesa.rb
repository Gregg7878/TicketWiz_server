class Mpesa < ApplicationRecord
    belongs_to :customer
    belongs_to :ticket
end
