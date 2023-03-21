# frozen_string_literal: true

module Layout
  module Notice
    class Component < Application::Component
      def initialize(notice:)
        @notice = notice
      end

      def render?
        @notice
      end
    end
  end
end
