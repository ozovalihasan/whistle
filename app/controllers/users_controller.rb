class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @whiistle = Whiistle.new
    @user = User.find(params[:id])
    @followers = @user.followers.with_attached_profile_picture.with_attached_cover_image
    @followings = @user.followings
    @whiistles = @user.whiistles
  end
end
