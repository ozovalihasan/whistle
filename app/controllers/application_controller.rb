class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private 

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:username, :fullname, :email, :cover_image,
               :profile_picture, :password, :password_confirmation)
    end
  end

end
