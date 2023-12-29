class UserApplication < ApplicationRecord
  has_one_attached :image, :dependent => :destroy
  belongs_to :user ,  optional: true
  belongs_to :location ,  optional: true

  # def set_column_to_true
  #   update_attribute(:is_completed, true)
  # end
end
