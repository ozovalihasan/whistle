# frozen_string_literal: true

module Users
  module ProfileImageButton
    class Component < Application::Component
      def initialize(user:, shape: nil, size: nil)
        @user = user
        @shape = shape
        @size = size
      end
    end
  end
end
