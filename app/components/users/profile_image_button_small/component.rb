# frozen_string_literal: true

class Users::ProfileImageButtonSmall::Component < Application::Component
  def initialize(user:)
    @user = user
  end
end
