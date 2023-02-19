# frozen_string_literal: true

class Whiistles::ToggleRewhiistleOrQuoteButtonComponent < ApplicationComponent
  include ApplicationHelper
  
  def initialize(whiistle:, current_user_presenter:)
    @whiistle = whiistle
    @current_user_presenter = current_user_presenter
  end

  def active_button
    if @current_user_presenter.rewhiistled? @whiistle
      Whiistles::DestroyRewhiistleOrQuoteButtonComponent.new(whiistle: @whiistle)
    else
      Whiistles::CreateRewhiistleOrQuoteButtonComponent.new whiistle: @whiistle
    end
  end
  
end
