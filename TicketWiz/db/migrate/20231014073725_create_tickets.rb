class CreateTickets < ActiveRecord::Migration[7.0]
  def change
    create_table :tickets do |t|
      t.references :event, null: false, foreign_key: true
      t.references :customer, null: false, foreign_key: true
      t.string :ticket_type
      t.decimal :price
      t.datetime :purchase_date

      t.timestamps
    end
  end
end
