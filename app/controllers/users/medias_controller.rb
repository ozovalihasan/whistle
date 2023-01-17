class Users::MediasController < Users::TabsController

  def index
    super
    
    @all_whiistles = @user.whiistles.joins(:pictures_attachments).distinct.descending_order
    @paginated_whiistles, @last_page, @page = PaginateWhiistles.call(@all_whiistles, params[:page])
  end
  
end
