# frozen_string_literal: true

class Whiistles::CreateRewhiistleButton::Component < Application::Component
  def initialize(whiistle:)
    @whiistle = whiistle
  end
end
