class UsersTabPresenter < TabPresenter
  attr_reader :relation_name
  
  def initialize(user, name, paginated_records, relation_name)
    super(user, name, paginated_records)

    @relation_name = relation_name
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