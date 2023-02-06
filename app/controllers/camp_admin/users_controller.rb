# frozen_string_literal: true

module CampAdmin
  # user
  class UsersController < ApplicationController
    before_action :set_user, except: %i[index]

    def edit; end

    def index
      @users = User.search(params[:q])
                   .order("#{params[:sort]} #{params[:direction]}")
                   .page(params[:page])

      respond_to do |format|
        format.html
        format.csv { send_data User.to_csv }
      end
    end

    def show; end

    def update
      if @user.update(user_params)
        redirect_to @user
      else
        render 'edit'
      end
    end

    def destroy
      return unless @user.destroy

      redirect_to admin_users_path
    end

    private

    def set_user
      @user = User.find(params[:id])
    end
  end
end
