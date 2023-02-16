# frozen_string_literal: true

class Users::PaginatedUsersComponent < ApplicationComponent
  def initialize(paginated_users:)
    @paginated_users = paginated_users
  end

end
