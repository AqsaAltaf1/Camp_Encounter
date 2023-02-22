# frozen_string_literal: true

# comment
module CampAdmin
  # comment
  class CamplocationsController < ApplicationController
    before_action :set_camp, only: %i[edit show update destroy]
    before_action :authenticate_user!, except: %i[index show]
    before_action :camp_autherization, except: %i[show]
    helper_method :sort_column, :sort_direction


    def index
      @camplocations = Camplocation.search(params[:p])
                                   .order("#{sort_column} #{sort_direction}")
                                   .page(params[:page])

      respond_to do |format|
        format.html
        format.csv { send_data Camplocation.to_csv }
      end
    end

    def show; end

    def new
      @camplocation = Camplocation.new
    end

    def edit; end

    def create
      @camplocation = Camplocation.new(camp_params)
      if @camplocation.save!
        redirect_to camp_admin_camplocations_path, notice: "Your camplocation has been saved"

      else
        render :new, alert: "Something went wrong"
      end
    end

    def update
      if @camplocation.update(camp_params)
        redirect_to camp_admin_camplocations_path, notice: "Your profile has been updated."
      else
        render 'edit', alert: "Something went wrong"
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

    def sort_column
      User.column_names.include?(params[:sort]) ? params[:sort] : 'title'
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : 'asc'
    end

    def camp_autherization
      authorize([:camp_admin, Camplocation])
    end

  end
end
