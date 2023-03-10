# frozen_string_literal: true

class Whiistles::FormOpeningModal::Component < Application::Component
  def initialize(label:, whiistle:, path:, value: nil)
    @label = label
    @whiistle = whiistle
    @path = path
    @value = value
  end

end
