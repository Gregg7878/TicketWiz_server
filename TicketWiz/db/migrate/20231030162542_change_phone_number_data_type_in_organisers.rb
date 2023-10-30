class ChangePhoneNumberDataTypeInOrganisers < ActiveRecord::Migration[6.1]
  def change
    change_column :organisers, :phone_number, :bigint
  end
end
