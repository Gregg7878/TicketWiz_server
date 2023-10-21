class RemovePurchaseDateFromTickets < ActiveRecord::Migration[7.0]
  def change
    remove_column :tickets, :purchase_date, :datetime
  end
end
