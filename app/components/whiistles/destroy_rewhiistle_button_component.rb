# frozen_string_literal: true

class Whiistles::DestroyRewhiistleButtonComponent < ApplicationComponent
  def initialize(whiistle:, rewhiistle:)
    @whiistle = whiistle
    @rewhiistle = rewhiistle
  end

end
