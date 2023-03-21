# frozen_string_literal: true

module Whiistles
  module FormPicturesButton
    class Component < Application::Component
      def initialize(form:)
        @form = form
      end
    end
  end
end
