# frozen_string_literal: true

class Users::TabsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user

  layout :set_layout_for_user_tabs_frame, only: %i[index]

  def index
    return if request.format.turbo_stream?

    @sidebar_right_presenter = SidebarRightPresenter.new(@user, current_user)
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_layout_for_user_tabs_frame
    if turbo_frame_request? && (turbo_frame_request_id == "user-tabs")
      false
    end
  end
end
