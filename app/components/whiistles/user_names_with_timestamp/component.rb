# frozen_string_literal: true

class Whiistles::UserNamesWithTimestamp::Component < Application::Component
  def initialize(whiistle:)
    @whiistle = whiistle
  end
end
