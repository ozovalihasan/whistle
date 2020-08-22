# frozen_string_literal: true

class WhiistlesController < ApplicationController
  before_action :authenticate_user!

  def index
    @whiistle = Whiistle.new
    followings = current_user.followings.pluck(:id) << current_user.id
    @whiistles = Whiistle.all.where(user_id: followings).order(created_at: :desc).includes(:user)
    @suggested_users = User.where('id NOT IN (?)', followings)
  end

  def create
    @whiistle = current_user.whiistles.new(whiistle_params)

    if @whiistle.save

      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def whiistle_params
    params.require(:whiistle).permit(:body)
  end
end
