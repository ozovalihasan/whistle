# frozen_string_literal: true

class UsersTabPresenter < TabPresenter
  def no_user_info
    case name
    when :followings
      "#{user.fullname} doesn't follow anyone."
    when :followers
      "#{user.fullname} doesn't have any follower."
    else
      raise StandardError, 'The name is not available'
    end
  end
end
