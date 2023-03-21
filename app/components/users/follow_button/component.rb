# frozen_string_literal: true

module Users
  module FollowButton
    class Component < Application::Component
      def initialize(user:)
        @user = user
      end
    end
  end
end
