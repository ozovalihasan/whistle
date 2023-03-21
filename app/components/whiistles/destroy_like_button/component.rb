# frozen_string_literal: true

module Whiistles
  module DestroyLikeButton
    class Component < Application::Component
      def initialize(like:)
        @like = like
        @whiistle = like.whiistle
      end
    end
  end
end
