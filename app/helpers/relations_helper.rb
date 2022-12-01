module RelationsHelper
  def add_delete_following(user, relation)
    if relation
      render 'users/delete_following', relation: relation
    elsif current_user.id != user.id
      render 'users/add_following', user_id: user.id
    else
      ""
    end
  end
end
