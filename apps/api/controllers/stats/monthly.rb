class Api::Controllers::Stats::Monthly
  include Api::Action

  def call(params)
    self.body = 'Hello there'
    self.status = 201
  end
end
