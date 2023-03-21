# frozen_string_literal: true

module Whiistles
  module FloodWhiistleForm
    class Component < Application::Component
      def initialize(main_form:)
        @main_form = main_form
      end
    end
  end
end
