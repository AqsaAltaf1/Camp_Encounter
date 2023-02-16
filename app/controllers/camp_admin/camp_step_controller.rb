module CampAdmin
  class CampStepController < ApplicationController
    include Wicked::Wizard

    steps :personal_info, :terms, :surety, :sincerly, :end, :finish

    def show
      @user = current_user
      @current_step = current_step_index + 1
      @total_steps = steps.count
      render_wizard
    end

    def update
      @user = current_user
      @user.update(user_params)
      render_wizard @user
    end

    private

    def redirect_to_finish_wizard
      redirect_to root_url, notice: "Thank you for signing up."
    end

    def user_params
      params.require(:client).permit(:first_name, :last_name, :email, :country, :profile_image, :Date_of_birth,:Current_age, :Gender, :agree, :agreement, :reason, :option)
    end
  end
end

