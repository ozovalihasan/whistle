# frozen_string_literal: true

class Whiistles::ReplyButton::Component < Application::Component
  include ApplicationHelper
  
  def initialize(whiistle:)
    @whiistle = whiistle
  end

end
