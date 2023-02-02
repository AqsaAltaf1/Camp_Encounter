# frozen_string_literal: true

module CampAdmin
  # user
  class UsersController < ApplicationController
    before_action :set_user, except: [:index, :search]

    def edit; end

    def index
      if params[:q].present?
        @users = User.all.where("first_name like ?", params[:q])
      else
        @users = User.all
      end

    end

    # def search
    #    @users =User.where("first_name like ?", "%"+params[:q]+"%")
    # end
      # if params[:search_by_first_name] && params[:search_by_first_name] != ""
      #   @users = @users.where("name like ?",
      #   "%# {params[:search_by_first_name]}%")
      # end
    #   if params[:search_by_color] && params[:search_by_color] != ""
    #     @kittens = @kittens.where("color like ?",
    #     "%# {params[:search_by_color]}%")
    #   end
    #  if params[:search_by_age] && params[:search_by_age] != ""
    #     @kittens = @kittens.where("age like ?",
    #     "%# {params[:search_by_color]}%")
    #   end



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
