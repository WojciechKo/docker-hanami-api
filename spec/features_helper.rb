# Require this file for feature tests
require_relative './spec_helper'

RSpec.configure do |config|
  config.include Rack::Test::Methods

  def app
    Hanami.app
  end
end
