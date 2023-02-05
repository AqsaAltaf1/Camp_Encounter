# frozen_string_literal: true

# Record
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  paginates_per 3
end
