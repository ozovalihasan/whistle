# frozen_string_literal: true

class Users::FollowingsController < Users::TabsController
  def index
    super

    followings = @user.followings.with_current_user_situation(current_user).with_attached_profile_picture
    @paginate_users = PaginateUsers.new(followings, params[:page], user_followings_url(@user), current_user)

    return if request.format.turbo_stream?

    @tab_presenter = UsersTabPresenter.new(@user, :followings, @paginate_users)
  end
end
