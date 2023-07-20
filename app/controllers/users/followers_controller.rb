# frozen_string_literal: true

class Users::FollowersController < Users::PaginatedFollowersController
  def index
    super

    @tab_presenter = UsersTabPresenter.new(@user, :followers, @paginate_users)
  end
end
