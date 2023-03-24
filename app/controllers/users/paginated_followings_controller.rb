# frozen_string_literal: true

class Users::PaginatedFollowingsController < Users::TabsController
  def index
    super

    followings = @user.followings
    @paginate_users = PaginateUsers.new(followings, params[:page], user_paginated_followings_url(@user), current_user)
  end
end
