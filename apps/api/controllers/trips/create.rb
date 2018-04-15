class Api::Controllers::Trips::Create
  include Api::Action

  def call(params)
    self.body = 'Hello there'
    self.status = 201
  end
end
