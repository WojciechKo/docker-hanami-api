require "features_helper"

RSpec.describe 'Error responses' do
  subject do
    request
    json_response
  end

  describe '404 error' do
    let(:request) { post "/api/some/unknown/page" }

    it 'should have 404 status' do
      subject
      expect(last_response).to have_attributes(status: 404)
    end

    it { should include(
      'status' => 404,
      'error' => "Not Found"
    )}
  end

  describe '500 error' do
    let(:request) { post "/api/trips" }

    before do
      allow_any_instance_of(Api::Controllers::Trips::Create).to receive(:status=) do
        this_is_unknown_method_call_made_to_check_if_we_wrap_exceptions
      end
      subject
    end

    it 'should have 500 status' do
      expect(last_response).to have_attributes(status: 500)
    end

    it { should include(
      'status' => 500,
      'error' => "Internal Server Error"
    )}
  end
end
