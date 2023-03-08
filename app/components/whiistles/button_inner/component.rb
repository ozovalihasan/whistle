# frozen_string_literal: true

class Whiistles::ButtonInner::Component < ViewComponent::Base
  def initialize(active: false)
    @active = active
  end
end
