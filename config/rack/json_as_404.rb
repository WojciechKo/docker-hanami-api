class Rack::JsonAs404
  def initialize(app)
    @app = app
  end

  def call(env)
    response = @app.call(env).tap do |response|
      return RackResponse.error(404, "Not Found") if response[0] == 404
    end
  end
end
