# frozen_string_literal: true

module Users
  class FollowingsController < Users::TabsController
    def index
      super

      followings = @user.followings.with_attached_profile_picture
      @paginate_users = PaginateUsers.new(followings, params[:page], user_followings_url(@user), current_user)

      return if request.format.turbo_stream?

      @tab_presenter = UsersTabPresenter.new(@user, :followings, @paginate_users)
    end
  end
end
