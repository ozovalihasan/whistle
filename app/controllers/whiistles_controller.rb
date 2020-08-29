class WhiistlesController < ApplicationController
  before_action :authenticate_user!

  def index
    @whiistle = Whiistle.new
    @whiistles = current_user.whiistles_including_users
    @suggested_users = current_user.suggested_users.with_attached_profile_picture.with_attached_cover_image
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
