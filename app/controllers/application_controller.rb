# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  layout :set_layout
  
  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:username, :fullname, :email, :cover_image,
               :profile_picture, :password, :password_confirmation)
    end
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:username, :fullname, :email, :cover_image,
               :profile_picture, :password, :current_password)
    end
  end

  def set_layout
    if turbo_frame_request? && (turbo_frame_request_id == "user-content")
      "user_content"
    end
  end
end
