# frozen_string_literal: true

module Users
  class TabsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_user

    def index
      return if request.format.turbo_stream?

      @sidebar_right_presenter = SidebarRightPresenter.new(@user, current_user)
    end

    private

    def set_user
      @user = User.find(params[:user_id])
    end
  end
end
