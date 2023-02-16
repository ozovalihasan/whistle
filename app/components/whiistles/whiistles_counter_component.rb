# frozen_string_literal: true

class Whiistles::WhiistlesCounterComponent < ApplicationComponent
  def initialize(whiistles_count:)
    @whiistles_count = whiistles_count
  end

end
