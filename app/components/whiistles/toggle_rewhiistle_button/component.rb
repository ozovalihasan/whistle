# frozen_string_literal: true

class Whiistles::ToggleRewhiistleButton::Component < Application::Component
  include ApplicationHelper
  
  def initialize(whiistle:, current_user_presenter:)
    @whiistle = whiistle
    @current_user_presenter = current_user_presenter
  end

  def active_button
    if @current_user_presenter.rewhiistled? @whiistle
        Whiistles::DestroyRewhiistleButton::Component.new(rewhiistle: @current_user_presenter.rewhiistle_of(@whiistle))
    else
        Whiistles::CreateRewhiistleButton::Component.new(whiistle: @whiistle)
    end
  end

end
