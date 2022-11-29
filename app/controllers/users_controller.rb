class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @whiistle = Whiistle.new
    @user = User.find(params[:id])
    @followers = @user.followeds.with_attached_profile_picture
    @followings = @user.followings
    @whiistles = @user.whiistles
  end
end
