class AddAssociationsToMpesas < ActiveRecord::Migration[7.0]
  def change
    add_reference :mpesas, :customer, foreign_key: true
    add_reference :mpesas, :ticket, foreign_key: true
  end
end
