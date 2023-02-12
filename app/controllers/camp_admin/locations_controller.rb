# frozen_string_literal: true

# Style/Documentation
module CampAdmin
  # comment
  class LocationsController < ApplicationController
    before_action :set_location, only: %i[edit show update destroy]

    def index
      @locations = Location.all.page(params[:page])
    end

    def active_camp
      @locations = Location.all.where(status: :active)
    end

    def intro

    end

    def show; end

    def edit; end

    def new
      @location = Location.new
    end

    def update
      if @location.update(location_params)
        redirect_to camp_admin_location_path
      else
        render 'edit'
      end
    end

    def create
      @location = Location.new(location_params)

      if @location.save!
        redirect_to camp_admin_locations_path
      else
        render :new, status: :unprocessable_entity
      end
    end

    def destroy
      return unless @location.destroy

      redirect_to camp_admin_locations_path
    end

    private

    def location_params
      params.require(:location).permit(:title, :camp_location, :status, :start_date, :end_date)
    end

    def set_location
      @location = Location.find(params[:id])
    end
  end
end
