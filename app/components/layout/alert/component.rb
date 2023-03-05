# frozen_string_literal: true

class Layout::Alert::Component < Application::Component
  def initialize(alert:)
    @alert = alert
  end

end
