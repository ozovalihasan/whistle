# frozen_string_literal: true

module Whiistles
  module DestroyRewhiistleButton
    class Component < Application::Component
      def initialize(rewhiistle:)
        @rewhiistle = rewhiistle
      end
    end
  end
end
