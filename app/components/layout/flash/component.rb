# frozen_string_literal: true

class Layout::Flash::Component < Application::Component
  def initialize(message:, alert: false)
    @message = message
    @alert = alert
  end

  def render?
    @message
  end
end
