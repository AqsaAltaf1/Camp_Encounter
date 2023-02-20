# frozen_string_literal: true

# comment
class CamplocationPolicy < ApplicationPolicy
  attr_reader :user, :location

  def initialize(user, camplocation)
    @user = user
    @camplocation = camplocation
  end

  def index?
    false
  end

  def show?
    false
  end

  def create?
    user.admin?
  end

  def new?
    create?
  end

  def update?
    user.admin?
  end

  def edit?
    update?
  end

  def destroy?
    user.admin?
  end
end
