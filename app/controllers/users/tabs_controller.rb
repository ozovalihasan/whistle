class Users::TabsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user

  def index
    @sidebar_right_presenter = SidebarRightPresenter.new(@user, current_user)
  end

  private 

  def set_user
    @user = User.find(params[:user_id])
  end
end
