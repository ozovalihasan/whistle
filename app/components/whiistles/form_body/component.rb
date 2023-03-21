# frozen_string_literal: true

module Whiistles
  module FormBody
    class Component < Application::Component
      def initialize(form:, label:, value: nil, open_modal: false, modal_path: nil)
        @form = form
        @label = label
        @value = value
        @open_modal = open_modal
        @modal_path = modal_path
      end
    end
  end
end
