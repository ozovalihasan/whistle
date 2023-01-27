class SidebarRightPresenter
  attr_reader :user, :relation, :random_followings
  
  def initialize(user, user2)
    @user = user
    @relation = user2.following_relations.find_by(followed_id: user.id)
    @random_followings = user.followers.limit(5).order("RANDOM()") - [ user2 ]
  end
end