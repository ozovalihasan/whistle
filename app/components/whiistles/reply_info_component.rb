# frozen_string_literal: true

class Whiistles::ReplyInfoComponent < ApplicationComponent
  def initialize(whiistle:)
    @whiistle = whiistle
  end

  def render?
    @whiistle.is_a? Reply
  end

end
