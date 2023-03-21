# frozen_string_literal: true

module Whiistles
  module Pictures
    class Component < Application::Component
      def initialize(whiistle:)
        @whiistle = whiistle
      end

      def render?
        @whiistle.pictures.present?
      end
    end
  end
end
