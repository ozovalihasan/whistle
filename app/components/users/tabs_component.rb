# frozen_string_literal: true

class Users::TabsComponent < ApplicationComponent
  include WhiistlesHelper
  
  def initialize(tab_presenter:, sidebar_right_presenter:, current_user_presenter: nil, paginated_records: nil)
    @tab_presenter = tab_presenter
    @user = tab_presenter.user
    @selected_tab = tab_presenter.name

    @sidebar_right_presenter = sidebar_right_presenter
    @paginated_records = paginated_records
    @current_user_presenter = current_user_presenter
  end

end
