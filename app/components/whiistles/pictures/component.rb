# frozen_string_literal: true

class Whiistles::Pictures::Component < Application::Component
  def initialize(whiistle:)
    @whiistle = whiistle
  end

  def render?
    @whiistle.pictures.present?
  end
end
