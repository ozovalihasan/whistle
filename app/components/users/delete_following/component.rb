# frozen_string_literal: true

module Users
  module DeleteFollowing
    class Component < Application::Component
      def initialize(relation:)
        @relation = relation
      end
    end
  end
end
