# frozen_string_literal: true

class Whiistles::BodyAndPicturesComponent < ApplicationComponent
  def initialize(whiistle:, show_quoted_whiistle: true)
    @whiistle = whiistle
    @show_quoted_whiistle = show_quoted_whiistle
  end

end
