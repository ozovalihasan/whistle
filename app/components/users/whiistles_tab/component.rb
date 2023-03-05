# frozen_string_literal: true

class Users::WhiistlesTab::Component < Application::Component
  def initialize(tab_presenter:)
    @tab_presenter = tab_presenter
    @paginated_whiistles = tab_presenter.paginated_records
    @current_user_presenter = tab_presenter.current_user_presenter
  end

end
