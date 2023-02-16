# frozen_string_literal: true

class Whiistles::QuotedWhiistleButtonComponent < ApplicationComponent
  include ApplicationHelper
  
  def initialize(whiistle:)
    @whiistle = whiistle
  end

end
