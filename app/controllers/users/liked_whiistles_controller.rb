class Users::LikedWhiistlesController < Users::TabsController
  
  def index
    super
    
    all_whiistles = @user.liked_whiistles.includes(user:  [{ profile_picture_attachment: :blob }])
    @paginated_whiistles = PaginateWhiistles.new(all_whiistles, params[:page], user_liked_whiistles_url(@user))
    @paginated_whiistles.set_basic
    @current_user_presenter = CurrentUserPresenter.new(current_user)
    
    unless request.format.turbo_stream?
      @tab_presenter = WhiistlesTabPresenter.new(@user, :liked_whiistles, @paginated_whiistles, @current_user_presenter)
    end
  end
  
end
