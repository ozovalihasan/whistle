# frozen_string_literal: true

class Users::UsersHavingRelationsComponent < ApplicationComponent
  def initialize(paginated_users:, tab_presenter:)
    @paginated_users = paginated_users
    @tab_presenter = tab_presenter
  end

end
