RSpec.describe Celly::Player do
    before(:each) do
      @player = Celly::Player.new
    end
  
    it "returns a 200 status when requesting a player by their id" do
      expect(@player.profile(8478402)[:status]).to eq("200")
    end
  
    it "returns a 200 when requesting a player's single season stats" do
      expect(@player.season_stats(8478402,20192020)[:status]).to eq("200")
    end
  
    it "returns a 200 when requesting a player's regular season career stats" do
      expect(@player.regular_season_career_stats(8478402)[:status]).to eq("200")
    end
  
    it "returns a 200 when requesting a player's career playoffs stats" do
      expect(@player.playoffs_career_stats(8478402)[:status]).to eq("200")
    end
  
    it "returns a 200 when requesting a player's playoffs stats by season" do
      expect(@player.playoffs_stats_by_year(8478402)[:status]).to eq("200")
    end
  end