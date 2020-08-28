class WhiistlesController < ApplicationController
  before_action :authenticate_user!

  def index
    @whiistle = Whiistle.new
    followings_and_user_ids = current_user.followings.ids << current_user.id
    @whiistles = Whiistle.created_by(followings_and_user_ids).descending_order.includes(:user)
    @suggested_users = User.where('id NOT IN (?)', followings_and_user_ids)
  end

  def create
    whiistle = current_user.whiistles.new(whiistle_params)

    if whiistle.save
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
