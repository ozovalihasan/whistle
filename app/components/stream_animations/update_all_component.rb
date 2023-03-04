# frozen_string_literal: true

class StreamAnimations::UpdateAllComponent < ApplicationComponent
  def initialize(targets, **arguments )
    @targets = targets
    @arguments = arguments
  end

  def call
    render StreamAnimations::BaseComponent.new( action: "update", targets: @targets, **@arguments ) do
      content
    end
  end
end
