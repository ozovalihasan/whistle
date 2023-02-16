# frozen_string_literal: true

class Whiistles::WhiistleComponent < ApplicationComponent
  include WhiistlesHelper
  
  def initialize(whiistle:, current_user_presenter:, show_flood_info: false, user: nil)
    @whiistle = whiistle
    @show_flood_info = show_flood_info
    @user = user
    @current_user_presenter = current_user_presenter
  end
end
