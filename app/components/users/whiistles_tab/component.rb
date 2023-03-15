# frozen_string_literal: true

class Users::WhiistlesTab::Component < Application::Component
  def initialize(tab_presenter:)
    @tab_presenter = tab_presenter
    @paginate_whiistles = tab_presenter.paginate_records
    @current_user_presenter = @paginate_whiistles.current_user_presenter
  end

end
