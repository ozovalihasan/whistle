# frozen_string_literal: true

module Shared
  module ListUsers
    class Component < Application::Component
      def initialize(paginate_users:)
        @paginate_users = paginate_users
      end
    end
  end
end
