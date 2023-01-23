class Users::FollowersController < Users::TabsController

  def index
    super

    followers = @user.followers.with_attached_profile_picture
    @paginated_users = PaginateRecords.new(followers, params[:page], user_followers_url(@user), "users/list_users")
  end

end