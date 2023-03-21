# frozen_string_literal: true

module Whiistles
  module ListPaginatedWhiistles
    class Component < Application::Component
      def initialize(paginate_whiistles:)
        @paginate_whiistles = paginate_whiistles
      end
    end
  end
end
