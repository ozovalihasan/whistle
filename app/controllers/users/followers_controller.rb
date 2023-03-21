# frozen_string_literal: true

class Users::FollowersController < Users::TabsController
  def index
    super

    followers = @user.followers.with_attached_profile_picture
    @paginate_users = PaginateUsers.new(followers, params[:page], user_followers_url(@user), current_user)

    return if request.format.turbo_stream?

    @tab_presenter = UsersTabPresenter.new(@user, :followers, @paginate_users)
  end
end
