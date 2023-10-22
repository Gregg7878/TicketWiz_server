class CreateNewPayments < ActiveRecord::Migration[7.0]
  def change
    create_table :new_payments do |t|
      t.references :ticket, foreign_key: true
      t.integer :amount
      t.string :transaction_id
      t.string :status

      t.timestamps
    end
  end
end

