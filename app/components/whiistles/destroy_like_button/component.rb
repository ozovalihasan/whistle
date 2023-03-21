# frozen_string_literal: true

class Whiistles::DestroyLikeButton::Component < Application::Component
  def initialize(like:)
    @like = like
    @whiistle = like.whiistle
  end
end
