# frozen_string_literal: true

module Users
  module PaginateWhiistles
    class Component < Application::Component
      def initialize(paginate_whiistles:)
        @paginate_whiistles = paginate_whiistles
      end
    end
  end
end
