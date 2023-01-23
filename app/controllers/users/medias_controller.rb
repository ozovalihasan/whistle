class Users::MediasController < Users::TabsController

  def index
    super
    
    all_whiistles = @user.whiistles.joins(:pictures_attachments).distinct.descending_order
    @paginated_whiistles = PaginateRecords.new(all_whiistles, params[:page], user_medias_url(@user), "whiistles/list_whiistles")
  end
  
end
