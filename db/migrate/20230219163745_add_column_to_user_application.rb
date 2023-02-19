class AddColumnToUserApplication < ActiveRecord::Migration[5.2]
  def change
    add_column :user_applications, :is_completed, :boolean, :default => false
  end
end
