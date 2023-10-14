class CreateCalendarEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :calendar_events do |t|
      t.references :event, null: false, foreign_key: true
      t.references :customer, null: false, foreign_key: true
      t.references :organiser, null: false, foreign_key: true

      t.timestamps
    end
  end
end
