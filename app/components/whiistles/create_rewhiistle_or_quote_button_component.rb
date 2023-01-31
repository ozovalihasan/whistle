# frozen_string_literal: true

class Whiistles::CreateRewhiistleOrQuoteButtonComponent < ViewComponent::Base
  def initialize(whiistle:)
    @whiistle = whiistle
  end

end
