# frozen_string_literal: true

module Whiistles
  module WhiistleWithFloodInfo
    class Component < Application::Component
      def initialize(whiistle:, current_user_presenter:)
        @whiistle = whiistle
        @current_user_presenter = current_user_presenter
      end

      def call
        render component('whiistles/whiistle', whiistle: @whiistle, current_user_presenter: @current_user_presenter,
                                               show_flood_info: true)
      end
    end
  end
end
