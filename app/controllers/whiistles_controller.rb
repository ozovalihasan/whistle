class WhiistlesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_whiistle, only: :show

  def show
    @user = @whiistle.user
  end

  def index
    @whiistle = Whiistle.new
    @all_whiistles = current_user.main_page_whiistles
    @paginated_whiistles, @last_page, @page = PaginateWhiistles.call(@all_whiistles, params[:page])
    @suggested_users = current_user.suggested_users.with_attached_profile_picture
  end

  def create
    @whiistle = current_user.whiistles.new(whiistle_params.merge(type: BaseWhiistle.types["Whiistle"]))

    result = FloodCreator.call(floods_params, @whiistle, current_user)
    if result.success?
      flash[:notice] = result.message
      @whiistles = current_user.main_page_whiistles
    else
      flash[:alert] = result.message
    end
  end

  private

  def set_whiistle
    @whiistle = BaseWhiistle.find(params[:id])
  end

  def whiistle_params
    params.require(:whiistle).permit(:body, :quoted_whiistle_url, pictures: [])
  end

  def floods_params
    params.require(:whiistle).permit(floods: [:body, :quoted_whiistle_url, pictures: []])
  end
end

