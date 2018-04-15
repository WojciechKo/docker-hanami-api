require "features_helper"

RSpec.describe 'POST /api/trips' do
  subject { post "/api/trips", params }

  let(:params) do
    {
      start_address: start_address_param,
      destination_address: destination_address_param,
      price: price_param,
      date: date_param
    }
  end
  let(:start_address_param) { "Plac Europejski 2, Warszawa, Polska"}
  let(:destination_address_param) { "Plac Europejski 2, Warszawa, Polska"}
  let(:price_param) { 124 }
  let(:date_param) { '2018-04-23T18:25:43.511Z' }

  describe 'happy path' do
    it { should have_attributes(status: 201) }

    it 'returns trip data' do
      subject
      expect(last_response.body).to match_json_schema(:trips_create_success)

      expect(json_response).to eq(
        'trip' => {
          'start_address' => start_address_param,
          'price' => price_param,
          'date' => date_param,
          'destination_address' => destination_address_param
        }
      )
    end
  end

  context 'with invalid date' do
    let(:date_param) { '2018-04-Z' }

    it { should have_attributes(status: 422) }

    it 'returns trip data' do
      subject
      expect(last_response.body).to match_json_schema(:trips_create_failure)

      expect(json_response).to eq({
        'status' => 422,
        'errors' => {'date' => ['must be a date time']}
      })
    end
  end
end
