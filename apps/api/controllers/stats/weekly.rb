class Api::Controllers::Stats::Weekly
  include Api::Action

  def call(params)
    self.body = {message: 'Hello there'}.to_json
    self.status = 201
  end
end
