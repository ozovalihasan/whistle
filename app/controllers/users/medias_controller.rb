class Users::MediasController < Users::TabsController

  def index
    super
    
    all_whiistles = @user.whiistles.joins(:pictures_attachments).distinct.descending_order
    @paginated_whiistles = PaginateWhiistles.new(all_whiistles, params[:page], user_medias_url(@user))
    @paginated_whiistles.set_basic
    @current_user_presenter = CurrentUserPresenter.new(current_user)
    
    unless request.format.turbo_stream?
      @tab_presenter = WhiistlesTabPresenter.new(@user, :medias, @paginated_whiistles, @current_user_presenter)
    end
    
  end
  
end
