# frozen_string_literal: true

module Layout
  module LeftSide
    class Component < Application::Component
      def initialize(current_user:)
        @current_user = current_user
      end

      def render?
        @current_user
      end
    end
  end
end
