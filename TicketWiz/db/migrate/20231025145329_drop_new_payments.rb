class DropNewPayments < ActiveRecord::Migration[7.0]
  def change
    drop_table :new_payments
  end
  
end
