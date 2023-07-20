# frozen_string_literal: true

class Users::PaginatedFollowersController < Users::TabsController
  def index
    super

    followers = @user.followers
    @paginate_users = PaginateUsers.new(followers, params[:page], user_paginated_followers_url(@user), current_user)
  end
end
