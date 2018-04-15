class Api::Controllers::Stats::Weekly
  include Api::Action

  def call(params)
    self.body = 'Hello there'
    self.status = 201
  end
end
