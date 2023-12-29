module CampAdmin
  class UserApplicationsController < ApplicationController
    before_action :set_user, only: %i[edit update destroy show]

    def index
      @user_application = UserApplication.all
    end

    def show; end

    def new
      @user_application = current_user.create_user_application

      @loc  = Location.find(params[:location_id]) if params[:location_id]
      current_user.user_application.update(location_id: @loc.id) if @loc

      redirect_to camp_admin_camp_step_index_path(user_application_id: @user_application)
    end

    def create
    end

    def edit; end

    def update
      if @user_application.update(application_params)
        redirect_to camp_admin_user_application_path
      else
        render 'edit'
      end
    end

    def destroy
      return unless @user_application.destroy

      redirect_to camp_admin_user_applications_path
    end

    private

    def application_params
      params.require(:user_application).permit(:first_name, :last_name, :email, :country, :image, :Gender, :agree, :agreement, :reason)
    end

    def set_user
      @user_application = UserApplication.find(params[:id])
    end
  end
end