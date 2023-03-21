# frozen_string_literal: true

module Whiistles
  module CreateLikeButton
    class Component < Application::Component
      def initialize(whiistle:)
        @whiistle = whiistle
      end
    end
  end
end
