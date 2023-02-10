# frozen_string_literal: true

# Style/Documentation
class LocationsController < ApplicationController
  def index
    @locations = Location.all
  end

  def show
    @location = Location.find(params[:id])
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.new(location_params)

    if @location.save!
      redirect_to locations_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    return unless @location.destroy

    redirect_to locations_path
  end

  private

  def location_params
    params.require(:location).permit(:title, :camp_location, :status, :start_date, :end_date)
  end
end
