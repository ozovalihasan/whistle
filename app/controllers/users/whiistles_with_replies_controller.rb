class Users::WhiistlesWithRepliesController < Users::TabsController
  def index
    super
    
    @whiistle = Whiistle.new
    
    @all_whiistles = @user.whiistles_of_whiistles_and_replies_index_page.includes(user:  [{ profile_picture_attachment: :blob }])
    @paginated_whiistles, @last_page, @page = PaginateWhiistles.call(@all_whiistles, params[:page])
  end
end
