class Users::FollowersController < ApplicationController
  before_action :set_user

  def index
    @followers = @user.followings
  end

  private 

  def set_user
    @user = User.find(params[:user_id])
  end
end