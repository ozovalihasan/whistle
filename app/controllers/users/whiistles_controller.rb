# frozen_string_literal: true

class Users::WhiistlesController < Users::PaginatedWhiistlesController
  def index
    super

    whiistle = Whiistle.new

    @tab_presenter = WhiistlesTabPresenter.new(@user, :whiistles_without_replies, @paginate_whiistles, whiistle)
  end

  def new
    @whiistle = Whiistle.new
    @current_user_presenter = CurrentUserPresenter.new(current_user)
  end

  def create
    @completed_successfully, message, @whiistle = WhiistleCreator.call(params, current_user)
    if @completed_successfully
      flash[:notice] = message
      @current_user_presenter = CurrentUserPresenter.new(current_user)
    else
      flash[:alert] = message
    end
  end
end
