class WhiistlesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_whiistle, only: :show

  def show
    @user = @whiistle.user
  end

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

  
  end

  private

  def set_whiistle
    @whiistle = BaseWhiistle.find(params[:id])
  end

  def whiistle_params
    params.require(:whiistle).permit(:body, pictures: [])
  end
end
