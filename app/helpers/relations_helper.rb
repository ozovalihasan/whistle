module RelationsHelper
  def add_delete_following(user)
    if user.followeds.pluck(:id).include? current_user.id
      render 'users/delete_following', user: user
    else
      render 'users/add_following', user: user

    end
  end
end
