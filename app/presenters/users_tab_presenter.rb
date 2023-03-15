class UsersTabPresenter < TabPresenter
  
  def initialize(user, name, paginate_records)
    super(user, name, paginate_records)
  end

  def no_user_info
    if name == :followings
      user.fullname + " doesn't follow anyone."
    elsif name == :followers
      user.fullname + " doesn't have any follower."
    else
      raise StandardError.new "The name is not available"
    end
  end
end