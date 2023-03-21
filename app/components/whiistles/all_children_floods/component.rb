# frozen_string_literal: true

module Whiistles
  module AllChildrenFloods
    class Component < Application::Component
      def initialize(flood:, current_user_presenter:)
        @flood = flood
        @current_user_presenter = current_user_presenter
      end
    end
  end
end
