class UsersTabPresenter
  attr_reader :new_whiistle, :paginated_users, :user
  
  def initialize(paginated_users, relation_name)
    @paginated_users = paginated_users
    @relation_name = relation_name
  end

  def no_user_info
    if relation_name == :following
      user.fullname.concat "doesn't follow anyone."
    elsif relation_name == :follower
      user.fullname.concat "doesn't have any follower."
    end
  end

  def user_exist?
    paginated_users.records.present?
  end
end