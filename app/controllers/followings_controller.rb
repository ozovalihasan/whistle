# frozen_string_literal: true

class FollowingsController < ApplicationController
  before_action :authenticate_user!

  def create
    following = Following.new(user_id: current_user.id, followed_id: params[:followed_id])

    if following.save
      redirect_to root_path
    else
      redirect_to user_path(params[:followed_id])
    end
  end

  def destroy
    following = Following.find_by(user_id: current_user.id, followed_id: params[:followed_id])

    if following.destroy
      redirect_to root_path
    else
      redirect_to user_path(params[:followed_id])
    end
  end
end
