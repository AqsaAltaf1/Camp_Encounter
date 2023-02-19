# frozen_string_literal: true

module Users
  # comment
  class SessionsController < Devise::SessionsController
    def after_sign_in_path_for(_resource)
      if current_user&.client? && UserApplication.includes(:user_id)
        root_path
      elsif current_user.client?
        active_camp_camp_admin_location_path(current_user)
      else
        root_path
      end
    end
  end
end
