class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.string :title
      t.string :camp_location
      t.integer :status, default: 0
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps
    end
  end
end
