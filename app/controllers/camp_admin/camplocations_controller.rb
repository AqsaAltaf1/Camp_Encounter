# frozen_string_literal: true

# comment
module CampAdmin
class CamplocationsController < ApplicationController

  before_action :set_camp, only: %i[edit show update destroy]
  def index
    @camplocations = Camplocation.search(params[:p])
                                 .order("#{params[:sort]} #{params[:direction]}")
                                 .page(params[:page])

    respond_to do |format|
      format.html
      format.csv { send_data Camplocation.to_csv }
    end
  end

  def show
  end

  def edit
  end

  def new
    @camplocation = Camplocation.new
  end

  def create
    @camplocation = Camplocation.new(camp_params)

    if @camplocation.save!
      redirect_to camp_admin_camplocations_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @camplocation.update(camp_params)
      redirect_to camp_admin_camplocations_path
    else
      render 'edit'
    end
  end

  def destroy
    return unless @camplocation.destroy

    redirect_to camp_admin_camplocations_path
  end

  private

  def camp_params
    params.require(:camplocation).permit(:title)
  end

  def set_camp
    @camplocation = Camplocation.find(params[:id])
  end
end
end
