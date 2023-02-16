class AddColumnToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :agree, :boolean
    add_column :users, :agreement, :boolean
    add_column :users, :reason, :string
    add_column :users, :option, :string
  end
end
