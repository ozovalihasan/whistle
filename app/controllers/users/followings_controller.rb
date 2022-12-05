class Users::FollowingsController < ApplicationController
  before_action :set_user

  def index
    @followings = @user.followeds
  end

  private 

  def set_user
    @user = User.find(params[:user_id])
  end
end