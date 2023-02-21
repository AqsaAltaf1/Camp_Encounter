# frozen_string_literal: true

# Style/Documentation
module CampAdmin
  # comment
  class LocationsController < ApplicationController
    before_action :set_location, only: %i[edit show update destroy intro]
    before_action :authenticate_user!, except: %i[index show]

    def index
      @locations = Location.all.page(params[:page])
    end

    def show; end

    def new
      @location = Location.new
      authorize([:camp_admin, @location])
    end

    def edit
      authorize([:camp_admin, @location])
    end

    def create
      authorize([:camp_admin, @location])
      @location = Location.new(location_params)

      if @location.save!
        redirect_to camp_admin_locations_path, notice: "Your location has been saved"
      else
        render :new, status: :unprocessable_entity
      end
    end

    def update
      authorize([:camp_admin, @location])
      if @location.update(location_params)
        redirect_to camp_admin_location_path, notice: "Your location has been updated"
      else
        render 'edit', notice: "Something went wrong"
      end
    end

    def destroy
      authorize([:camp_admin, @location])
      return unless @location.destroy

      redirect_to camp_admin_locations_path
    end

    def active_camp
      @locations = Location.all.where(status: :active)
    end

    def intro; end

    private

    def location_params
      params.require(:location).permit(:title, :camp_location, :status, :start_date, :end_date)
    end

    def set_location
      @location = Location.find(params[:id])
    end
  end
end
