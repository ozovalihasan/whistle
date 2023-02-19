# frozen_string_literal: true

class Whiistles::BodyAndPicturesComponent < ApplicationComponent
  def initialize(whiistle:, show_quoted_whiistle: true, show_pictures: true)
    @whiistle = whiistle
    @show_quoted_whiistle = show_quoted_whiistle
    @show_pictures = show_pictures
  end

end
