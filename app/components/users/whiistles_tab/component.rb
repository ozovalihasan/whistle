# frozen_string_literal: true

class Users::WhiistlesTab::Component < Application::Component
  def initialize(tab_presenter:)
    @tab_presenter = tab_presenter
    @paginate_whiistles = tab_presenter.paginate_records
    @cur_user = @paginate_whiistles.current_user_presenter.current_user
  end
end
