# frozen_string_literal: true

module Users
  module WhiistlesTab
    class Component < Application::Component
      def initialize(tab_presenter:)
        @tab_presenter = tab_presenter
        @paginate_whiistles = tab_presenter.paginate_records
        @cur_user = @paginate_whiistles.current_user_presenter.current_user
      end
    end
  end
end
