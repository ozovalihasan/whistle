# frozen_string_literal: true

module Users
  class FollowersController < Users::TabsController
    def index
      super

      followers = @user.followers.with_attached_profile_picture
      @paginate_users = PaginateUsers.new(followers, params[:page], user_followers_url(@user), current_user)

      return if request.format.turbo_stream?

      @tab_presenter = UsersTabPresenter.new(@user, :followers, @paginate_users)
    end
  end
end
