class Users::LikedWhiistlesController < Users::TabsController
  
  def index
    super
    
    @all_whiistles = @user.liked_whiistles.includes(user:  [{ profile_picture_attachment: :blob }])
    @paginated_whiistles, @last_page, @page = PaginateWhiistles.call(@all_whiistles, params[:page])
  end
  
end
