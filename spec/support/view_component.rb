require "view_component/test_helpers"

RSpec.configure do |config|
  config.include ViewComponent::TestHelpers, type: :component
  
  config.include Helpers::Components, type: :component
  config.include Helpers::Components, type: :view

  config.before(:all, :type => :component) do
    Dir[Rails.root.join('app', 'components', '**', '*.rb')].each { |f| require f }
    mock_components(
      Application::Component.descendants - [ 
        MockComponents::Base::Component, 
        MockComponents::SimpleForm::Component 
      ])
  end

  config.before(:each, :type => :component) do
    unmock_components([self.class.metadata[:described_class]])
    
    if defined?(allowed_components)
      unmock_components(allowed_components)
    end
  end

  config.after(:each, :type => :component) do
    mock_components([self.class.metadata[:described_class]] - [Application::Component])

    if defined?(allowed_components)
      mock_components(allowed_components)
    end
  end

end