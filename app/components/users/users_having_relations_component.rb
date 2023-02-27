# frozen_string_literal: true

class Users::UsersHavingRelationsComponent < ApplicationComponent
  def initialize(tab_presenter:)
    @tab_presenter = tab_presenter
    @paginated_users = tab_presenter.paginated_records
  end

end
