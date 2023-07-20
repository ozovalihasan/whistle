# frozen_string_literal: true

class Whiistles::Whiistle::Component < Application::Component
  include WhiistlesHelper

  def initialize(whiistle:, current_user_presenter:, show_flood_info: false)
    @whiistle = whiistle
    @show_flood_info = show_flood_info
    @current_user_presenter = current_user_presenter
  end
end
