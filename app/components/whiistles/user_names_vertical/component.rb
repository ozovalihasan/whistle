# frozen_string_literal: true

module Whiistles
  module UserNamesVertical
    class Component < Application::Component
      def initialize(user:)
        @user = user
      end
    end
  end
end
