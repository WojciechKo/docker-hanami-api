class Rack::WrapExceptions
  def initialize(app, logger=nil)
    @app = app
    @logger = logger
  end

  def call(env)
    @app.call(env)
  rescue StandardError => e
    @logger.debug e.inspect + "\n\t" + e.backtrace.join("\n\t")

    return RackResponse.error(500, "Internal Server Error")
  end
end
