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
    @whiistle = current_user.whiistles.new(whiistle_params.merge(type: BaseWhiistle.types["Whiistle"]))

    if @whiistle.save
      parent_whiistle = @whiistle
      floods_params[:floods].to_h.to_a.sort_by(&:first).each do |_, flood_params|
        parent_whiistle = parent_whiistle.create_flood( flood_params.merge( base_whiistle_id: parent_whiistle.id, user_id: current_user.id ) )  
      end
      
      flash[:notice] = 'You whiistled'
      @whiistles = current_user.whiistles_including_users
    else
      flash[:alert] = @whiistle.errors.full_messages[0]
    end
  
  end

  private

  def set_whiistle
    @whiistle = BaseWhiistle.find(params[:id])
  end

  def whiistle_params
    params.require(:whiistle).permit(:body, pictures: [])
  end

  def floods_params
    params.require(:whiistle).permit(floods: [:body, pictures: []])
  end
end
