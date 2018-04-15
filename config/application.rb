require_relative 'environment'
Dir[File.join(__dir__, 'rack', '*.rb')].each { |f| require f }

Application = Rack::Builder.new do
  use Rack::CommonLoggerPlus, LOG
  use Rack::WrapExceptions, LOG
  use Rack::Lint
  use Rack::JsonAs404

  map "/api" do
    run Hanami.app
  end
end
