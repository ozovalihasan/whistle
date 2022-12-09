class Users::MediasController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user

  def index
    @whiistle = Whiistle.new
    @followings = @user.followings
    @followeds = @user.followers.with_attached_profile_picture
    @whiistles = Whiistle.joins(:pictures_attachments).where(user_id: @user.id).order(created_at: :desc)
    @relation = current_user.following_relations.find_by(followed_id: @user.id)
  end

  private 

  def set_user
    @user = User.find(params[:user_id])
  end
end
