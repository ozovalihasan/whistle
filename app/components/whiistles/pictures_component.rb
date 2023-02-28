# frozen_string_literal: true

class Whiistles::PicturesComponent < ApplicationComponent
  include ApplicationHelper
  
  def initialize(whiistle:)
    @whiistle = whiistle
  end

  def render?
    @whiistle.pictures.present?
  end
end
