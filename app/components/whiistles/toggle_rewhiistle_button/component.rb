# frozen_string_literal: true

class Whiistles::ToggleRewhiistleButton::Component < Application::Component
  def initialize(whiistle:, current_user_presenter:)
    @whiistle = whiistle
    @current_user_presenter = current_user_presenter
  end

  def active_button
    if @current_user_presenter.rewhiistled? @whiistle
      component('whiistles/destroy_rewhiistle_button', rewhiistle: @current_user_presenter.rewhiistle_of(@whiistle))
    else
      component('whiistles/create_rewhiistle_button', whiistle: @whiistle)
    end
  end
end
