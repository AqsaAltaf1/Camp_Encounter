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
