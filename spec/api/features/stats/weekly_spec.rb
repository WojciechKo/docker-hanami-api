require "features_helper"

RSpec.describe 'GET /api/stats/weekly' do
  subject { get "/api/stats/weekly" }

  it { should have_attributes(status: 201) }
end

