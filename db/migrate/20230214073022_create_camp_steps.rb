class CreateCampSteps < ActiveRecord::Migration[5.2]
  def change
    create_table :camp_steps do |t|
      t.integer :progress
      t.timestamps
    end
  end
end
