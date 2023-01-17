class Users::LikedWhiistlesController < Users::TabsController
  
  def index
    super
    
    all_whiistles = @user.liked_whiistles.includes(user:  [{ profile_picture_attachment: :blob }])
    @paginated_whiistles = PaginateRecords.new(all_whiistles, params[:page], user_liked_whiistles_url(@user))
  end
  
end
