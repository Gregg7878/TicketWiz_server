class ChangePhoneNumberDataTypeInCustomers < ActiveRecord::Migration[7.0]
  def up
    change_column :customers, :phone_number, :string
  end

  def down
    change_column :customers, :phone_number, :integer
  end
end
