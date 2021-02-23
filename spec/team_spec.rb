RSpec.describe Celly::Team do
    before(:each) do
      @team = Celly::Team.new
    end
  
    it "returns a 200 status when requesting all teams' data" do
      expect(@team.all[:status]).to eq("200")
    end

    it "returns a 200 status when requesting a team's data" do
      expect(@team.find(7)[:status]).to eq("200")
    end

    it "returns a 200 status when requesting a team's roster data" do
      expect(@team.roster(7)[:status]).to eq("200")
    end

    it "returns a 200 status when requesting a team's statistics" do
      expect(@team.stats(7)[:status]).to eq("200")
    end
  end