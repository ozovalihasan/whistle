class WhiistlesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_whiistle, only: :show

  def show
    @sidebar_right_presenter = SidebarRightPresenter.new(@whiistle.user, current_user)
    @current_user_presenter = CurrentUserPresenter.new(current_user)
  end

  def index
    @whiistle = Whiistle.new
    all_whiistles = current_user.main_page_whiistles
    @paginated_whiistles = PaginateWhiistles.new(all_whiistles, params[:page], whiistles_url)
    @paginated_whiistles.set_for_whiistles_index_page
    @current_user_presenter = CurrentUserPresenter.new(current_user)
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

