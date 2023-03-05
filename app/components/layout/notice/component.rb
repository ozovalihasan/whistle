# frozen_string_literal: true

class Layout::Notice::Component < Application::Component
  def initialize(notice:)
    @notice = notice
  end

  def render?
    @notice
  end
end
