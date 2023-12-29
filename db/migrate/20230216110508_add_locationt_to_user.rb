# frozen_string_literal: true

# comment
class AddLocationtToUser < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :location
  end
end
