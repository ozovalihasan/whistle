# frozen_string_literal: true

require 'view_component/test_helpers'

Dir[Rails.root.join('app', 'components', '**', '*.rb')].each { |f| require f }


RSpec.configure do |config|
  config.include ViewComponent::TestHelpers, type: :component

  config.include Helpers::Components, type: :component
  config.include Helpers::Components, type: :view

  config.include ApplicationHelper, type: :component
  config.include ApplicationHelper, type: :view

  config.before(:each, type: :component) do
    components = [self.class.metadata[:described_class]]

    components.concat allowed_components if defined?(allowed_components)

    mock_components(
      components
    )
  end

  config.before(:each, type: :view) do
    components = [self.class.metadata[:described_class]]

    components.concat allowed_components if defined?(allowed_components)

    mock_components(
      components
    )
  end
end
