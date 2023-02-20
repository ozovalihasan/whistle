# frozen_string_literal: true

class Whiistles::PicturesComponent < ApplicationComponent
  include ApplicationHelper
  
  def initialize(whiistle:)
    @whiistle = whiistle
  end

end
