class Users::FollowersController < ApplicationController
  before_action :set_user

  def index
    @followings = @user.followings
    @followers = @user.followers.with_attached_profile_picture
    @whiistles = @user.whiistles
    @relation = current_user.following_relations.find_by(followed_id: @user.id)
  end

  private 

  def set_user
    @user = User.find(params[:user_id])
  end
end