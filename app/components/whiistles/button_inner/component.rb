# frozen_string_literal: true

module Whiistles
  module ButtonInner
    class Component < Application::Component
      def initialize(active: false)
        @active = active
      end
    end
  end
end
