# frozen_string_literal: true

class Whiistles::ToggleRewhiistleOrQuoteButton::Component < Application::Component
  def initialize(whiistle:, current_user_presenter:)
    @whiistle = whiistle
    @current_user_presenter = current_user_presenter
  end

  def active_button
    if @current_user_presenter.rewhiistled? @whiistle
      component("whiistles/destroy_rewhiistle_or_quote_button", whiistle: @whiistle)
    else
      component("whiistles/create_rewhiistle_or_quote_button", whiistle: @whiistle)
    end
  end
  
end
