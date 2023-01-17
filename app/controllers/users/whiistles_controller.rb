class Users::WhiistlesController < Users::TabsController
  def index
    super
    
    @whiistle = Whiistle.new
    
    all_whiistles = @user.whiistles_of_whiistles_index_page.includes(user:  [{ profile_picture_attachment: :blob }])
    @paginated_whiistles = PaginateRecords.new(all_whiistles, params[:page], user_whiistles_url(@user))
  end
end
