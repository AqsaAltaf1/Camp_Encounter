module CampAdmin
  class CampStepController < ApplicationController
    include Wicked::Wizard

    steps :personal_info, :terms, :surety, :sincerly, :end, :finish

    def show
      @user_application = UserApplication.find(params[:user_application_id]) if params[:user_application_id]
      @current_step = current_step_index + 1
      @total_steps = steps.count
      render_wizard
    end

    def update
      @user_application = UserApplication.find(params[:user_application_id])
      @user_application.update(application_params)
      render_wizard @user_application
    end

    private

    def redirect_to_finish_wizard
      redirect_to root_url, notice: "Thank you for signing up."
    end

    def application_params
      params.require(:user_application).permit(:first_name, :last_name, :email, :country, :image, :Date_of_birth,:Current_age, :Gender, :agree, :agreement, :reason, :option)
    end
  end
end

