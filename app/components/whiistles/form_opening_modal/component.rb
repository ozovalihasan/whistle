# frozen_string_literal: true

class Whiistles::FormOpeningModal::Component < Application::Component
  def initialize(label:, whiistle:, path:, current_user_presenter:, value: nil)
    @label = label
    @whiistle = whiistle
    @path = path
    @current_user_presenter = current_user_presenter
    @value = value
  end

end
