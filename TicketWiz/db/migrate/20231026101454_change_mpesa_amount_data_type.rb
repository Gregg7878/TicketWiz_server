class ChangeMpesaAmountDataType < ActiveRecord::Migration[7.0]
    def change
      change_column :mpesas, :amount, :integer, using: 'amount::integer'
    end

  
end
