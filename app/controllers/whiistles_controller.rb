class WhiistlesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_whiistle, only: :show

  def new
    @whiistle = Whiistle.new
    @current_user_presenter = CurrentUserPresenter.new(current_user)
  end
  
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
    @status, @whiistle = WhiistleCreator.call(params, current_user)
    if @status.success?
      flash[:notice] = @status.message
      @whiistles_size = current_user.main_page_whiistles.size
      @current_user_presenter = CurrentUserPresenter.new(current_user)
    else
      flash[:alert] = @status.message
    end
  end

  private

  def set_whiistle
    @whiistle = BaseWhiistle.find(params[:id])
  end

end

