# frozen_string_literal: true

module Users
  module AddDeleteFollowing
    class Component < Application::Component
      def initialize(user:, cur_user:, relation:)
        @user = user
        @cur_user = cur_user
        @relation = relation
      end
    end
  end
end
