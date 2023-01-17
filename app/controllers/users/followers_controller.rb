class Users::FollowersController < Users::TabsController

  def index
    super

    @followers = @user.followers.with_attached_profile_picture
  end

end