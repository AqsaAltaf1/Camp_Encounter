# frozen_string_literal: true

# comment
class CamplocationPolicy < ApplicationPolicy
  attr_reader :user, :location

  def initialize(user, camplocation)
    @user = user
    @camplocation = camplocation
  end
end
# super
