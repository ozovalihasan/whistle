# frozen_string_literal: true

module StreamAnimations
  module Base
    class Component < Application::Component
      def initialize(
        action:,
        enter_class: 'animate-cart-in',
        exit_class: 'animate-cart-out',
        target: nil,
        targets: nil
      )
        @action = action
        @enter_class = enter_class
        @exit_class = exit_class
        @target = target
        @targets = targets
      end
    end
  end
end
