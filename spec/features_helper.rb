# Require this file for feature tests
require_relative './spec_helper'

RSpec.configure do |config|
  config.include Rack::Test::Methods
  config.include JsonHelpers

  def app
    Application
  end
end
