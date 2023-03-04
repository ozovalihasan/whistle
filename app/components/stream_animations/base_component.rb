# frozen_string_literal: true

class StreamAnimations::BaseComponent < ApplicationComponent
  
  def initialize(
    action:, 
    enter_class: "animate-cart-in", 
    exit_class: "animate-cart-out",
    target: nil,
    targets: nil
  )
    @action = action
    @enter_class = enter_class
    @exit_class = exit_class
    @target = target
    @targets = targets
  end
  
end
