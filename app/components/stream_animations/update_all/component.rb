# frozen_string_literal: true

module StreamAnimations
  module UpdateAll
    class Component < Application::Component
      def initialize(targets:, **arguments)
        @targets = targets
        @arguments = arguments
      end

      def call
        render component('stream_animations/base', action: 'update', targets: @targets, **@arguments) do
          content
        end
      end
    end
  end
end
