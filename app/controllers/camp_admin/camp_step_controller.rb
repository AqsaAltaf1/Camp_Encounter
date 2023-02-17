module CampAdmin
  class CampStepController < ApplicationController
    include Wicked::Wizard

    steps :personal_info, :terms, :surety, :sincerly, :end, :finish

    def show
      @loc  = Location.find(params[:location_id]) if params[:location_id]
      current_user.update(location_id: @loc.id) if @loc
      @current_step = current_step_index + 1
      @total_steps = steps.count
      render_wizard
    end

    def update
      current_user.update(user_params)
      render_wizard current_user
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

