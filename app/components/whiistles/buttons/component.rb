# frozen_string_literal: true

module Whiistles
  module Buttons
    class Component < Application::Component
      include Turbo::FramesHelper

      def initialize(whiistle:, current_user_presenter:)
        @whiistle = whiistle
        @current_user_presenter = current_user_presenter
      end
    end
  end
end
