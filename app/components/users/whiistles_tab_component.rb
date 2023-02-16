# frozen_string_literal: true

class Users::WhiistlesTabComponent < ApplicationComponent
  def initialize(tab_presenter:, paginated_whiistles:, current_user_presenter:)
    @tab_presenter = tab_presenter
    @paginated_whiistles = paginated_whiistles
    @current_user_presenter = current_user_presenter
  end

end
