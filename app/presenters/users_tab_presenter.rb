class UsersTabPresenter < TabPresenter
  attr_reader :relation_name
  
  def initialize(user, name, relation_name)
    super(user, name)

    @relation_name = relation_name
  end

  def no_user_info
    if relation_name == :following
      user.fullname + " doesn't follow anyone."
    elsif relation_name == :follower
      user.fullname + " doesn't have any follower."
    end
  end
end