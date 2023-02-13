class AddColumnsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :Date_of_birth, :datetime
    add_column :users, :Current_age, :string
    add_column :users, :Gender, :string
  end
end
