require "rspec/mocks/standalone"

module Helpers
  module ComponentsTest
    class MockComponent < ViewComponent::Base
      def initialize(component)
        @name = component.name
      end
    
      def call
        @name
      end
    end
    
    def mock_components(components)
      components.each do |mocked_class|
        allow(mocked_class).to receive(:new) { MockComponent.new( mocked_class ) }  
        allow(mocked_class).to receive(:with_collection) { MockComponent.new( mocked_class ) }    
      end
    end
  end
end

RSpec.configure do |config|
  config.include Helpers::ComponentsTest, type: :component
  config.include Helpers::ComponentsTest, type: :view
end