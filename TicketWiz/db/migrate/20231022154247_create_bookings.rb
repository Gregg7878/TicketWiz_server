class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.references :customer, foreign_key: true
      t.date :date
      t.string :status

      t.timestamps
    end
  end
end
