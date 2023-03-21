# frozen_string_literal: true

class Whiistles::CreateRewhiistleOrQuoteButton::Component < Application::Component
  def initialize(whiistle:)
    @whiistle = whiistle
  end
end
