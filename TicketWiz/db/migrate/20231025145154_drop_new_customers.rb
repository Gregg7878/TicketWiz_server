class DropNewCustomers < ActiveRecord::Migration[7.0]
  def change
    drop_table :new_customers
  end
end
