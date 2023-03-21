# frozen_string_literal: true

class Users::PaginateUsers::Component < Application::Component
  def initialize(paginate_users:)
    @paginate_users = paginate_users
  end
end
