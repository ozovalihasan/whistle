# frozen_string_literal: true

class Whiistles::ReplyInfo::Component < Application::Component
  def initialize(whiistle:)
    @whiistle = whiistle
  end

  def render?
    @whiistle.is_a? Reply
  end

end
