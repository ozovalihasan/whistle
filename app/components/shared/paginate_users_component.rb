# frozen_string_literal: true

class Shared::PaginateUsersComponent < ApplicationComponent
  def initialize(paginated_users:)
    @paginated_users = paginated_users
  end
end
