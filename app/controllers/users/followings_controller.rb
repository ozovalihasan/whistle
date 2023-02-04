class Users::FollowingsController < Users::TabsController

  def index
    super

    followings = @user.followings.with_attached_profile_picture
    @paginated_users = PaginateUsers.new(followings, params[:page], user_followings_url(@user), current_user)
  end
  
end