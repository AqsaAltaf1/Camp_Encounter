# frozen_string_literal: true

# change
class ChangeIntegerLimitInUsers < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :phone_number, :integer, limit: 8
  end
end
