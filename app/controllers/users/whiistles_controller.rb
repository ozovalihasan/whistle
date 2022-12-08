class Users::WhiistlesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user

  def index
    @whiistle = Whiistle.new
    @followings = @user.followeds
    @followeds = @user.followings.with_attached_profile_picture
    @whiistles = @user.whiistles.order(created_at: :desc)
    @relation = current_user.following_relations.find_by(followed_id: @user.id)
  end

  private 

  def set_user
    @user = User.find(params[:user_id])
  end
end
