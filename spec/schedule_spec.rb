RSpec.describe Celly::Schedule do
  before(:each) do
    @schedule = Celly::Schedule.new
  end

  it 'returns a 200 status when requesting the schedule for all teams' do
    expect(@schedule.all('2020-02-23', '2020-02-25')[:status]).to eq('200')
  end

  it "returns a 200 status when requesting a team's schedule" do
    expect(@schedule.team('2020-02-23', '2020-02-25', 7)[:status]).to eq('200')
  end
end