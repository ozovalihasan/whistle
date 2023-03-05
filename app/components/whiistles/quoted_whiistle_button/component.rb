# frozen_string_literal: true

class Whiistles::QuotedWhiistleButton::Component < Application::Component
  include ApplicationHelper
  
  def initialize(whiistle:)
    @whiistle = whiistle
  end

end
