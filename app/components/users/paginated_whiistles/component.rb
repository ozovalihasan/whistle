# frozen_string_literal: true

class Users::PaginatedWhiistles::Component < Application::Component
  def initialize(paginated_whiistles:, current_user_presenter:)
    @paginated_whiistles = paginated_whiistles
    @current_user_presenter = current_user_presenter
  end

end