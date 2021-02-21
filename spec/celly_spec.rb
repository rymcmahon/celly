# RSpec.describe Celly do
#   it "has a version number" do
#     expect(Celly::VERSION).not_to be nil
#   end

#   it "does something useful" do
#     expect(false).to eq(true)
#   end
# end

RSpec.describe Celly::Player do
  it "returns a 200 status when requesting a player by their id" do
    expect(Celly::Player.profile(8478402)[:status]).to eq("200")
  end

  it "returns a 200 when requesting a player's single season stats" do
    expect(Celly::Player.season_stats(8478402,20192020)[:status]).to eq("200")
  end

  it "returns a 200 when requesting a player's regular season career stats" do
    expect(Celly::Player.regular_season_career_stats(8478402)[:status]).to eq("200")
  end

  it "returns a 200 when requesting a player's career playoffs stats" do
    expect(Celly::Player.career_playoff_stats(8478402)[:status]).to eq("200")
  end
end

