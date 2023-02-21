class Users::WhiistlesController < Users::TabsController
  def index
    super
    
    @whiistle = Whiistle.new
    
    all_whiistles = @user.whiistles_of_whiistles_index_page.includes(user:  [{ profile_picture_attachment: :blob }])
    @paginated_whiistles = PaginateWhiistles.new(all_whiistles, params[:page], user_whiistles_url(@user))
    @paginated_whiistles.set_connected
    @current_user_presenter = CurrentUserPresenter.new(current_user)
  end

  def new
    @whiistle = Whiistle.new
  end
end
