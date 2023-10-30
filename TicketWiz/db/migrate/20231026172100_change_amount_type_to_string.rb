class ChangeAmountTypeToString < ActiveRecord::Migration[7.0]
  def up
    change_column :mpesas, :amount, :string

    # Convert existing data to string
    Mpesa.all.each do |mpesa|
      mpesa.update(amount: mpesa.amount.to_s)
    end
  end

  def down
    change_column :mpesas, :amount, :integer

    Mpesa.all.each do |mpesa|
      mpesa.update(amount: mpesa.amount.to_i)
    end
  end
end
