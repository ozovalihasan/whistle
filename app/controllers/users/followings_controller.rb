class Users::FollowingsController < ApplicationController
  before_action :set_user

  def index
    @followings = @user.followeds
    @followeds = @user.followings.with_attached_profile_picture - [current_user]
    @whiistles = @user.whiistles
  end

  private 

  def set_user
    @user = User.find(params[:user_id])
  end
end