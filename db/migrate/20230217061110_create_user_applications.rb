# frozen_string_literal: true

# comment
class CreateUserApplications < ActiveRecord::Migration[5.2]
  def change  # rubocop:disable Metrics/MethodLength
    create_table :user_applications do |t|
      t.references :user
      t.references :location
      t.datetime 'Date_of_birth'
      t.string 'Current_age'
      t.string 'Gender'
      t.boolean 'agree'
      t.boolean 'agreement'
      t.string 'reason'
      t.string 'option'
      t.string 'first_name'
      t.string 'last_name'
      t.string 'email'

      t.timestamps
    end
  end
end
