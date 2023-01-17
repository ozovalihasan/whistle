class Users::FollowingsController < Users::TabsController

  def index
    super

    @followings = @user.followings.with_attached_profile_picture
  end
  
end