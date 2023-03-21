# frozen_string_literal: true

module Whiistles
  module LikeButton
    class Component < Application::Component
      def initialize(whiistle:, current_user_presenter:)
        @whiistle = whiistle
        @current_user_presenter = current_user_presenter
      end
    end
  end
end
