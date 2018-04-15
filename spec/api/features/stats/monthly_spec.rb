require "features_helper"

RSpec.describe 'GET /api/stats/monthly' do
  subject { get "/api/stats/monthly" }

  describe 'response status' do
    specify { should have_attributes(status: 201) }
  end
end

