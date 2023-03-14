class Users::WhiistlesWithRepliesController < Users::TabsController
  def index
    super

    all_whiistles = @user.whiistles_of_whiistles_and_replies_index_page.includes(user:  [{ profile_picture_attachment: :blob }])

    @paginated_whiistles = PaginateWhiistles.new(all_whiistles, params[:page], user_whiistles_with_replies_url(@user))
    @paginated_whiistles.set_connected
    
    @current_user_presenter = CurrentUserPresenter.new(current_user)

    unless request.format.turbo_stream?
      whiistle = Whiistle.new
      
      @tab_presenter = WhiistlesTabPresenter.new(@user, :whiistles_with_replies, @paginated_whiistles, @current_user_presenter, whiistle)
    end
    
  end
end
