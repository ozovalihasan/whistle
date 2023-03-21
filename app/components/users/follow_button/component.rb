# frozen_string_literal: true

class Users::FollowButton::Component < Application::Component
  def initialize(user:)
    @user = user
  end
end
