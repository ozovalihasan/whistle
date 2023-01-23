class Users::FollowingsController < Users::TabsController

  def index
    super

    followings = @user.followings.with_attached_profile_picture
    @paginated_users = PaginateRecords.new(followings, params[:page], user_followings_url(@user), "users/list_users")
  end
  
end