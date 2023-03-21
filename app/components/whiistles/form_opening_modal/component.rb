# frozen_string_literal: true

module Whiistles
  module FormOpeningModal
    class Component < Application::Component
      def initialize(label:, whiistle:, path:, cur_user:, value: nil)
        @label = label
        @whiistle = whiistle
        @path = path
        @cur_user = cur_user
        @value = value
      end
    end
  end
end
