require "features_helper"

RSpec.describe 'POST /api/trips' do
  subject { post "/api/trips" }

  it { should have_attributes(status: 201) }
end
