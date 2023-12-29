# frozen_string_literal: true

# comment
class Camplocation < ApplicationRecord
  paginates_per 3

  scope :search, ->(p) { p.present? ? where('title LIKE :p ', p: p) : all }

  def self.to_csv
    attributes = %w[id title]

    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |camp|
        csv << camp.attributes.values
      end
    end
  end
end
