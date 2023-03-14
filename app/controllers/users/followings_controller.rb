class Users::FollowingsController < Users::TabsController

  def index
    super

    followings = @user.followings.with_attached_profile_picture
    @paginated_users = PaginateUsers.new(followings, params[:page], user_followings_url(@user), current_user)

    unless request.format.turbo_stream?
      @tab_presenter = UsersTabPresenter.new(@user, :followings, @paginated_users) 
    end
  end
  
end