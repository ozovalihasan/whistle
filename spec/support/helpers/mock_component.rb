require "rspec/mocks/standalone"

module Helpers
  module ComponentsTest
    class MockComponent < ApplicationComponent
      def initialize(component, params, &block)
        @name = component.name
        @params= params
      end
    
      def call
        raw(@name + params_to_s + (content ? content : ""))
      end

      def params_to_s
        return "" if @params.nil?

        "(" + @params.map {|param_key, param_value| param_key.to_s + ": " + param_value.class.name}.join(", ")  + ")"
      end
    end
    
    def mock_components(components)
      components.each do |mocked_class|
        allow(mocked_class).to receive(:new) {|params| MockComponent.new( mocked_class, params ) }
        allow(mocked_class).to receive(:with_collection) { MockComponent.new( mocked_class ) }    
      end
    end
  end
end