# frozen_string_literal: true

# comment
class CreateCamplocations < ActiveRecord::Migration[5.2]
  def change
    create_table :camplocations do |t|
      t.string :title

      t.timestamps
    end
  end
end
