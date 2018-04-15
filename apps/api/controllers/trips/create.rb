class Api::Controllers::Trips::Create
  include Api::Action

  params do
    required(:start_address).filled(:str?)
    required(:destination_address).filled(:str?)
    required(:price).filled(:int?)
    required(:date).filled(:date_time?)
  end
  def call(params)
    unless params.valid?
      self.body = { status: 422,
                    errors: params.errors }.to_json
      self.status = 422
      return
    end

    trip = TripRepository.new.create(params)

    trip_json = trip.to_hash
    trip_json[:date] = trip.date.strftime('%Y-%m-%dT%H:%M:%S.%LZ')

    self.body = {trip: trip_json}.to_json
    self.status = 201
  end
end
