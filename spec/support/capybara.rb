require 'capybara/rspec'

Capybara.default_driver = :selenium_chrome_headless
Capybara.server_port = 30303