# frozen_string_literal: true

module MockComponents
  module Base
    class Component < ViewComponent::Base
      def initialize(component, *args, **kwargs)
        @name = component.name
        @args = args
        @kwargs = kwargs
      end

      def call
        raw(@name + params_to_s + (content || ''))
      end

      def params_to_s
        return '' if @kwargs.nil?

        '(' +
          @args.map { |arg| arg.class.name }.concat(
            @kwargs.map { |param_key, param_value| "#{param_key}: #{param_value.class.name}" }
          ).join(', ') +
          ')'
      end
    end
  end
end
