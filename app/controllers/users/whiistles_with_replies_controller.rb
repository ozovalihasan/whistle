class Users::WhiistlesWithRepliesController < Users::TabsController
  def index
    super

    all_whiistles = @user.whiistles_of_whiistles_and_replies_index_page.includes(user:  [{ profile_picture_attachment: :blob }])

    @paginate_whiistles = PaginateWhiistles.new(all_whiistles, params[:page], user_whiistles_with_replies_url(@user), current_user)
    @paginate_whiistles.set_connected

    unless request.format.turbo_stream?
      whiistle = Whiistle.new
      
      @tab_presenter = WhiistlesTabPresenter.new(@user, :whiistles_with_replies, @paginate_whiistles, whiistle)
    end
    
  end
end
