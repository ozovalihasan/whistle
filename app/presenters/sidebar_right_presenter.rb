# frozen_string_literal: true

class SidebarRightPresenter
  attr_reader :user, :cur_user, :relation, :random_followings

  def initialize(user, cur_user)
    @user = user
    @cur_user = cur_user
    @relation = cur_user.following_relations.find_by(followed_id: user.id)
    @random_followings = user.followings.limit(5).order('RANDOM()') - [cur_user]
  end
end
