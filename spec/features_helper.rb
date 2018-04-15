# Require this file for feature tests
require_relative './spec_helper'

require "rack/test"

RSpec.configure do |config|
  config.include Rack::Test::Methods
  config.include JsonHelpers

  # Json schema matchers
  config.include JSON::SchemaMatchers
  config.json_schemas[:trips_create_success] = "spec/api/schemas/trips/POST_success.json"
  config.json_schemas[:trips_create_failure] = "spec/api/schemas/trips/POST_failure.json"

  def app
    Application
  end
end
