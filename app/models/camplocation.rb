# frozen_string_literal: true

# comment
class Camplocation < ApplicationRecord
  paginates_per 3

  scope :search, ->(p) { p.present? ? where('title LIKE :p ', p: p) : all }

end
