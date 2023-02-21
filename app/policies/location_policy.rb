# frozen_string_literal: true

# comment
class LocationPolicy < ApplicationPolicy
  attr_reader :user, :location

  def initialize(user, location)
    @user = user
    @location = location
  end

  def index?
    false
  end

  def show?
    index?
  end

  def create?
    user.admin?
  end

  def new?
    create?
  end

  def update?
    create?
  end

  def edit?
    create?
  end

  def destroy?
    create?
  end
end
