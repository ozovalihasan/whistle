# frozen_string_literal: true

class Layout::LeftSide::Component < Application::Component
  include ApplicationHelper
  
  def initialize(current_user:)
    @current_user = current_user
  end

  def render?
    @current_user
  end
end
