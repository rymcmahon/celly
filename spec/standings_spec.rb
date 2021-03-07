RSpec.describe Celly::Standings do
  before(:each) do
    @standings = Celly::Standings.new
  end

  it 'returns a 200 status when requesting the league standings' do
    expect(@standings.overall(20202021)[:status]).to eq('200')
  end
end
