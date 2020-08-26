class FollowingsController < ApplicationController
  before_action :authenticate_user!

  def create
    following = Following.new(user_id: current_user.id, followed_id: params[:followed_id])
    redirect_to root_path if following.user_id == following.followed_id
    if following.save
      flash[:notice] = "You started to follow #{User.find(params[:followed_id]).fullname}"
      redirect_to root_path
    else
      redirect_to user_path(params[:followed_id])
    end
  end

  def destroy
    following = Following.find_by(user_id: current_user.id, followed_id: params[:followed_id])

    if following.destroy
      flash[:notice] = "You gave up to follow #{User.find(params[:followed_id]).fullname}"

      redirect_to root_path
    else
      redirect_to user_path(params[:followed_id])
    end
  end
end
