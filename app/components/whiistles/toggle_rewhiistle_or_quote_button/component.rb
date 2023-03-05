# frozen_string_literal: true

class Whiistles::ToggleRewhiistleOrQuoteButton::Component < Application::Component
  include ApplicationHelper
  
  def initialize(whiistle:, current_user_presenter:)
    @whiistle = whiistle
    @current_user_presenter = current_user_presenter
  end

  def active_button
    if @current_user_presenter.rewhiistled? @whiistle
      Whiistles::DestroyRewhiistleOrQuoteButton::Component.new(whiistle: @whiistle)
    else
      Whiistles::CreateRewhiistleOrQuoteButton::Component.new whiistle: @whiistle
    end
  end
  
end
