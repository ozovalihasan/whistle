class FollowingsController < ApplicationController
  before_action :authenticate_user!

  def create
    following = Following.new(user_id: current_user.id, followed_id: params[:followed_id])

    if following.save
      flash[:notice] = "You started to follow #{User.find(params[:followed_id]).fullname}"
    else
      flash[:alert] = following.errors.full_messages[0]
    end

    redirect_to user_path(params[:followed_id])
  end

  def destroy
    following = Following.find_by(user_id: current_user.id, followed_id: params[:followed_id])
    if following
      following.destroy
      flash[:notice] = "You gave up to follow #{User.find(params[:followed_id]).fullname}"
    else
      flash[:alert] = "These users aren\'t following each other"
    end
    redirect_to user_path(params[:followed_id])
  end
end
