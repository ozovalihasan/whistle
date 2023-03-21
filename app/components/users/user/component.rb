# frozen_string_literal: true

module Users
  module User
    class Component < Application::Component
      with_collection_parameter :user

      def initialize(user:, cur_user:)
        @user = user
        @cur_user = cur_user
      end
    end
  end
end
