class Location < ApplicationRecord

  validate :end_must_be_after_start

  enum status: { inactive: 0, active: 1 }


 def end_must_be_after_start
   errors.add(:end_time, 'must be greater than start time') if start_date > end_date
 end
end
