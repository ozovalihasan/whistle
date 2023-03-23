# frozen_string_literal: true

class Users::User::Component < Application::Component
  with_collection_parameter :user

  def initialize(user:)
    @user = user
  end
end
