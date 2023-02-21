# frozen_string_literal: true

class Whiistles::FormOpeningModalComponent < ApplicationComponent
  include ApplicationHelper
  
  def initialize(label:, whiistle:, path:, value: nil)
    @label = label
    @whiistle = whiistle
    @path = path
    @value = value
  end

end
