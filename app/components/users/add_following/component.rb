# frozen_string_literal: true

class Users::AddFollowing::Component < Application::Component
  def initialize(user_id:)
    @user_id = user_id
  end
end
