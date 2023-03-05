# frozen_string_literal: true

class Shared::InfiniteScrollUsers::Component < Application::Component
  def initialize(paginated_users:)
    @paginated_users = paginated_users
  end
end
