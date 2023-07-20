# frozen_string_literal: true

class Shared::ListUsers::Component < Application::Component
  def initialize(paginate_users:)
    @paginate_users = paginate_users
  end
end
