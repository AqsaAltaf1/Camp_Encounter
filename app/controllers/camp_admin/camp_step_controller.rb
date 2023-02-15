module CampAdmin
  class CampStepController < ApplicationController
    include Wicked::Wizard
    before_action :set_progress
    steps *User.form_steps

    def show
      @user = current_user
      render_wizard
    end

    def update
      @user = current_user
     if  @user.update(user_params)
      render_wizard @user
     else
      skip_step
    end

    end

    private

    def set_progress
      @total_steps = 5
      @current_step = step || 1
    end

    def redirect_to_finish_wizard
      redirect_to root_url, notice: "Thank you for signing up."
    end

    def user_params
      params.require(:client).permit(:first_name, :last_name, :email, :country, :image, :Date_of_birth,:Current_age, :Gender, :agree, :agreement, :reason, :option)
    end
  end
end

