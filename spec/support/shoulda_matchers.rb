# frozen_string_literal: true

RSpec.configure do |_config|
  Shoulda::Matchers.configure do |conf|
    conf.integrate do |with|
      with.test_framework :rspec
      with.library :rails
    end
  end
end
