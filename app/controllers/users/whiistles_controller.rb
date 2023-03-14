class Users::WhiistlesController < Users::TabsController
  def index
    super
    
    all_whiistles = @user.whiistles_of_whiistles_index_page.includes(user:  [{ profile_picture_attachment: :blob }])
    
    @paginated_whiistles = PaginateWhiistles.new(all_whiistles, params[:page], user_whiistles_url(@user))
    @paginated_whiistles.set_connected
    
    @current_user_presenter = CurrentUserPresenter.new(current_user)

    unless request.format.turbo_stream?
      whiistle = Whiistle.new
      
      @tab_presenter = WhiistlesTabPresenter.new(@user, :whiistles_without_replies, @paginated_whiistles, @current_user_presenter, whiistle)
    end
    
  end

  def new
    @whiistle = Whiistle.new
    @current_user_presenter = CurrentUserPresenter.new(current_user)
  end

  def create
    @status, @whiistle = WhiistleCreator.call(params, current_user)
    if @status.success?
      flash[:notice] = @status.message
      @current_user_presenter = CurrentUserPresenter.new(current_user)
    else
      flash[:alert] = @status.message
    end
  end

end
