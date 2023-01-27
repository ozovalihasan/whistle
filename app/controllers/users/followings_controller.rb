class Users::FollowingsController < Users::TabsController

  def index
    super

    followings = @user.followings.with_attached_profile_picture
    paginated_users = PaginateUsers.new(followings, params[:page], user_followings_url(@user))

    @users_tab_presenter = UsersTabPresenter.new(paginated_users, :following)
    
  end
  
end