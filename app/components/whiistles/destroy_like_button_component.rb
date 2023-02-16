# frozen_string_literal: true

class Whiistles::DestroyLikeButtonComponent < ApplicationComponent
  def initialize(like:)
    @like = like
    @whiistle = like.whiistle
  end

end
