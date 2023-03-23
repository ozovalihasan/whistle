# frozen_string_literal: true

class WhiistlesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_whiistle, only: :show

  def index
    all_whiistles = current_user.main_page_whiistles
    @paginate_whiistles = PaginateWhiistles.new(all_whiistles, params[:page], whiistles_url, current_user)
    @paginate_whiistles.set_for_whiistles_index_page

    return if request.format.turbo_stream?

    @whiistle = Whiistle.new
    @suggested_users = current_user.suggested_users
                                  .with_current_user_situation(current_user)
                                  .with_attached_profile_picture
  end

  def show
    @sidebar_right_presenter = SidebarRightPresenter.new(@whiistle.user, current_user)
    @current_user_presenter = CurrentUserPresenter.new(current_user)
  end

  def new
    @whiistle = Whiistle.new
    @current_user_presenter = CurrentUserPresenter.new(current_user)
  end

  def create
    @completed_successfully, message, @whiistle = WhiistleCreator.call(params, current_user)

    if @completed_successfully
      flash[:notice] = message
      @whiistles_size = current_user.main_page_whiistles.size
      @current_user_presenter = CurrentUserPresenter.new(current_user)
    else
      flash[:alert] = message
    end
  end

  private

  def set_whiistle
    @whiistle = BaseWhiistle.find(params[:id])
  end
end
