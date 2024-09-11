class ChangePhoneNumberTypeInCustomers < ActiveRecord::Migration[7.0]
  def change
    change_column :customers, :phone_number, :bigint
  end
end
