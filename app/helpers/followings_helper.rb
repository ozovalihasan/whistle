# frozen_string_literal: true

module FollowingsHelper
  def add_delete_following(followers, user)
    if followers.pluck(:id).include? current_user.id
      render 'users/add_following', user: user

    else
      render 'users/delete_following', user: user

    end
  end
end
