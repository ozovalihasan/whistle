# frozen_string_literal: true

module Users
  module UsersHavingRelations
    class Component < Application::Component
      def initialize(tab_presenter:)
        @tab_presenter = tab_presenter
        @paginate_users = tab_presenter.paginate_records
      end
    end
  end
end
