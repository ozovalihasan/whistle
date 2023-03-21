# frozen_string_literal: true

module Application
  class Component < ViewComponent::Base
    include ApplicationHelper

    private

    def filter_attribute(value, allowed_values, default: nil)
      return default unless value
      return value if allowed_values.include?(value)

      default
    end
  end
end
