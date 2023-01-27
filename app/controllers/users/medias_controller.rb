class Users::MediasController < Users::TabsController

  def index
    super
    
    all_whiistles = @user.whiistles.joins(:pictures_attachments).distinct.descending_order
    paginated_whiistles = PaginateWhiistles.new(all_whiistles, params[:page], user_medias_url(@user))
    paginated_whiistles.set_basic

    @whiistles_tab_presenter = WhiistlesTabPresenter.new(paginated_whiistles)
  end
  
end
