require 'capybara/rspec'
require 'capybara/rails'

RSpec.configure do |config|
  config.include Capybara::DSL, type: :request
  config.include Warden::Test::Helpers
  config.before :suite do
    Warden.test_mode!
  end
end
