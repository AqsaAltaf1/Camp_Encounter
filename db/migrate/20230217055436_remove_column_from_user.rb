class RemoveColumnFromUser < ActiveRecord::Migration[5.2]
  def change
    change_table :users do |t|
      t.remove "Date_of_birth"
      t.remove "Current_age"
      t.remove "Gender"
      t.remove "agree"
      t.remove "agreement"
      t.remove "reason"
      t.remove "option"
      t.remove "location_id"
    end
  end
end
