class WhiistlesController < ApplicationController
  before_action :authenticate_user!

  def index
    @whiistle = Whiistle.new
    @whiistles = current_user.whiistles_including_users
    @suggested_users = current_user.suggested_users.with_attached_profile_picture
  end

  def create
    whiistle = current_user.whiistles.new(whiistle_params)

    if whiistle.save
      flash[:notice] = 'You whiistled'
    else
      flash[:alert] = whiistle.errors.full_messages[0]
    end

    if params[:whiistle][:page] == 'whiistle_index'
      redirect_to whiistles_path
    elsif params[:whiistle][:page] == 'user_show'
      redirect_to user_path(params[:whiistle][:user_id].to_i)
    end
  end

  private

  def whiistle_params
    params.require(:whiistle).permit(:body)
  end
end
