# frozen_string_literal: true

class Whiistles::ReplyButtonComponent < ApplicationComponent
  include ApplicationHelper
  
  def initialize(whiistle:)
    @whiistle = whiistle
  end

end
