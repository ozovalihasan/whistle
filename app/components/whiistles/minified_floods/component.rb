# frozen_string_literal: true

class Whiistles::MinifiedFloods::Component < Application::Component
  def initialize(whiistle:, current_user_presenter:)
    @whiistle = whiistle
    @current_user_presenter = current_user_presenter
  end
end
