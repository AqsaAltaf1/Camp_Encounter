# frozen_string_literal: true

# user
module CampAdmin
  class UsersController < ApplicationController
    def edit
      @user = User.find(params[:id])
    end

    def index
      @users = User.all
    end

    def show
      @user = User.find(params[:id])
    end

    def update
      @user = User.find(params[:id])

      if @user.update(user_params)
        redirect_to @user
      else
        render 'edit'
      end
    end

    def destroy
      @user = User.find(params[:id])

      return unless @user.destroy

      redirect_to admin_users_path
    end
  end
end
