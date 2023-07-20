# frozen_string_literal: true

class Whiistles::ButtonInner::Component < Application::Component
  def initialize(active: false)
    @active = active
  end
end
