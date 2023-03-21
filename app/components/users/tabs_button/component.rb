# frozen_string_literal: true

module Users
  module TabsButton
    class Component < Application::Component
      def initialize(url:, text:, active_tab:)
        @url = url
        @text = text
        @active_tab = active_tab
      end
    end
  end
end
