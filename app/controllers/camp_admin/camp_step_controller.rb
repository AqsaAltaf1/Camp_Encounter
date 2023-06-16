module CampAdmin
  class CampStepController < ApplicationController
    include Wicked::Wizard
    steps :personal_info, :second_step, :third_step, :forth_step, :fifth_step, :sixth_step, :seventh_step

    def show
      @user = current_user
      render_wizard
    end

  end
end
