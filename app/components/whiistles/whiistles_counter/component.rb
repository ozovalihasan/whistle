# frozen_string_literal: true

class Whiistles::WhiistlesCounter::Component < Application::Component
  def initialize(whiistles_count:)
    @whiistles_count = whiistles_count
  end
end
