# frozen_string_literal: true

module Users
  module AddFollowing
    class Component < Application::Component
      def initialize(user_id:)
        @user_id = user_id
      end
    end
  end
end
