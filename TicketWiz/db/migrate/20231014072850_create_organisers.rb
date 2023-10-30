class CreateOrganisers < ActiveRecord::Migration[7.0]
  def change
    create_table :organisers do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.integer :phone_number
      t.integer :age

      t.timestamps
    end
  end
end
