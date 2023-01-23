class Users::WhiistlesWithRepliesController < Users::TabsController
  def index
    super
    
    @whiistle = Whiistle.new
    
    all_whiistles = @user.whiistles_of_whiistles_and_replies_index_page.includes(user:  [{ profile_picture_attachment: :blob }])
    @paginated_whiistles = PaginateRecords.new(all_whiistles, params[:page], user_whiistles_with_replies_url(@user), "whiistles/list_whiistles_with_related_whiistles")
  end
end
