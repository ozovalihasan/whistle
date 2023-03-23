# frozen_string_literal: true

class SidebarRightPresenter
  attr_reader :user, :cur_user, :relation, :random_followings

  def initialize(user, cur_user)
    @user = user
    @cur_user = cur_user
    @relation = cur_user.following_relations.find_by(followed_id: user.id)
    @random_followings = user.followings.with_current_user_situation(cur_user).in_random_order.limit(5).without(cur_user)
  end
end
