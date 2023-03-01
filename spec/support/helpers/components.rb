require "rspec/mocks/standalone"

module Helpers
  module Components
    def mock_components(components)
      components.each do |mocked_class|
        allow(mocked_class).to receive(:new) {|params| MockComponents::BaseComponent.new( mocked_class, params ) }
        allow(mocked_class).to receive(:with_collection) { MockComponents::BaseComponent.new( mocked_class ) }    
      end
    end
  end
end


