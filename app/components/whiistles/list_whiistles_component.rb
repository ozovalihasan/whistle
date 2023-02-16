# frozen_string_literal: true

class Whiistles::ListWhiistlesComponent < ApplicationComponent
  def initialize(whiistles:, current_user_presenter:)
    @whiistles = whiistles
    @current_user_presenter = current_user_presenter
  end

end