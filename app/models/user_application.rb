# frozen_string_literal: true

# comment
class UserApplication < ApplicationRecord
  has_one_attached :image, dependent: :destroy
  belongs_to :user, optional: true
  belongs_to :location, optional: true
end
