# frozen_string_literal: true

class StreamAnimations::UpdateAll::Component < Application::Component
  def initialize(targets:, **arguments )
    @targets = targets
    @arguments = arguments
  end

  def call
    render component("stream_animations/base", action: "update", targets: @targets, **@arguments) do
      content
    end
  end
end
