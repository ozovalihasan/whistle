# frozen_string_literal: true

class Whiistles::Buttons::Component < Application::Component
  include Turbo::FramesHelper

  def initialize(whiistle:, current_user_presenter:)
    @whiistle = whiistle
    @current_user_presenter = current_user_presenter
  end
end
