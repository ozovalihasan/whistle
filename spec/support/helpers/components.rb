module Helpers
  module Components

    def mock_components(allowed_components = [])
      (
        Application::Component.descendants - allowed_components
      ).each do |mocked_class|
        allow(mocked_class).to receive(:new) {|*args, **kwargs| MockComponents::Base::Component.new( mocked_class, *args, **kwargs ) }
        allow(mocked_class).to receive(:with_collection) {|*args, **kwargs| MockComponents::Base::Component.new( mocked_class, *args, **kwargs ) }
      end
    end

  end
end