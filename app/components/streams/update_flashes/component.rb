# frozen_string_literal: true

module Streams
  module UpdateFlashes
    class Component < Application::Component
      include Turbo::StreamsHelper

      def initialize(notice:, alert:)
        @notice = notice
        @alert = alert
      end
    end
  end
end
