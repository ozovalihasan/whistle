# frozen_string_literal: true

class Users::FollowingsController < Users::PaginatedFollowingsController
  def index
    super

    @tab_presenter = UsersTabPresenter.new(@user, :followings, @paginate_users)
  end
end
