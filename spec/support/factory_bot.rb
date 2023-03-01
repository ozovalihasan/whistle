RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods

  config.before(:each) do
    FactoryBot.reload
  end
end