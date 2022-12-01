class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @whiistle = Whiistle.new
    @user = User.find(params[:id])
    @followings = @user.followings.with_attached_profile_picture
    @followeds = @user.followeds
    @whiistles = @user.whiistles
    @relation = current_user.following_relations.find_by(followed_id: @user.id)
  end
end
