# frozen_string_literal: true

module Layout
  module Alert
    class Component < Application::Component
      def initialize(alert:)
        @alert = alert
      end
    end
  end
end
