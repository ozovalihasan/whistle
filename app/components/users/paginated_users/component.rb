# frozen_string_literal: true

class Users::PaginatedUsers::Component < Application::Component
  def initialize(paginated_users:)
    @paginated_users = paginated_users
  end

end
