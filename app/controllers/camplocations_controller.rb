# frozen_string_literal: true

# comment
class CamplocationsController < ApplicationController
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
    @camplocation = Camplocation.find(params[:id])
  end

  def new
    @camplocation = Camplocation.new
  end

  def create
    @camplocation = Camplocation.new(camp_params)

    if @camplocation.save!
      redirect_to camplocations_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @camplocation.update(camp_params)
      redirect_to camplocations_path
    else
      render 'edit'
    end
  end

  def destroy
    return unless @camplocation.destroy

    redirect_to camplocations_path
  end

  private

  def camp_params
    params.require(:camplocation).permit(:title)
  end
end
