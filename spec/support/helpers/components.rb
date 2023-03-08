require "rspec/mocks/standalone"

module Helpers
  module Components
    def unmock_components(components)
      components.each do |mocked_class|
        RSpec::Mocks.space.proxy_for(mocked_class).reset
      end
    end

    def mock_components(components)
      components.each do |mocked_class|
        mocked_class
        allow(mocked_class).to receive(:new) {|*args, **kwargs| MockComponents::Base::Component.new( mocked_class, *args, **kwargs ) }
        allow(mocked_class).to receive(:with_collection) {|*args, **kwargs| MockComponents::Base::Component.new( mocked_class, *args, **kwargs ) }
      end
    end
  end
end


