# frozen_string_literal: true

module Whiistles
  module ReplyInfo
    class Component < Application::Component
      def initialize(whiistle:)
        @whiistle = whiistle
      end

      def render?
        @whiistle.is_a? Reply
      end
    end
  end
end
