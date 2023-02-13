module CampAdmin
  class CampStepController < ApplicationController
    include Wicked::Wizard
    steps :personal_info, :second_step, :third_step, :forth_step

    def show
      @user = current_user
      render_wizard
    end

    def update
      @user = current_user
      @user.attributes = params[:user]
      render_wizard @user
    end

  end
end
