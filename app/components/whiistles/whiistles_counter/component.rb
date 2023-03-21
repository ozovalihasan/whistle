# frozen_string_literal: true

module Whiistles
  module WhiistlesCounter
    class Component < Application::Component
      def initialize(whiistles_count:)
        @whiistles_count = whiistles_count
      end
    end
  end
end
