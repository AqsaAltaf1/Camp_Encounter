# frozen_string_literal: true

# comment
class AddColumnToUserApplication < ActiveRecord::Migration[5.2]
  def change
    add_column :user_applications, :is_completed, :integer, default: 0
  end
end
