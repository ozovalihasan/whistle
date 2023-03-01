require "view_component/test_helpers"

RSpec.configure do |config|
  config.include ViewComponent::TestHelpers, type: :component
  
  config.include Helpers::Components, type: :component
  config.include Helpers::Components, type: :view
end