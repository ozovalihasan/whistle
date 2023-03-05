# frozen_string_literal: true

class Whiistles::AllChildrenFloods::Component < Application::Component
  def initialize(flood:, current_user_presenter:)
    @flood = flood
    @current_user_presenter = current_user_presenter
  end

end
