RSpec.describe Celly::Leaders do
  before(:each) do
    @leaders = Celly::Leaders.new
  end

  it "returns a 200 status when requesting goal leaders" do
    expect(@leaders.goals(20202021)[:status]).to eq("200") 
    expect(@leaders.goals(20202021)[:data][0]["leaderCategory"]).to eq("goals")
  end

  it "returns a 200 status when requesting assists leaders" do
    expect(@leaders.assists(20202021)[:status]).to eq("200") 
    expect(@leaders.assists(20202021)[:data][0]["leaderCategory"]).to eq("assists")
  end

  it "returns a 200 status when requesting point leaders" do
    expect(@leaders.points(20202021)[:status]).to eq("200") 
    expect(@leaders.points(20202021)[:data][0]["leaderCategory"]).to eq("points")
  end

  it "returns a 200 status when requesting wins leaders" do
    expect(@leaders.wins(20202021)[:status]).to eq("200") 
    expect(@leaders.wins(20202021)[:data][0]["leaderCategory"]).to eq("wins")
  end

  it "returns a 200 status when requesting shutouts leaders" do
    expect(@leaders.shutouts(20202021)[:status]).to eq("200") 
    expect(@leaders.shutouts(20202021)[:data][0]["leaderCategory"]).to eq("shutouts")
  end
end