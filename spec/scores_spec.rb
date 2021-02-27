RSpec.describe Celly::Scores do
  before(:each) do
    @scores = Celly::Scores.new
  end

  it "returns a 200 status when requesting today's scores" do
    expect(@scores.today[:status]).to eq("200") 
    expect(@scores.today[:data][0]["date"]).to eq(Date.today.strftime("%Y-%m-%d"))
  end

  it "returns a 200 status when requesting yesterday's scores" do
    expect(@scores.yesterday[:status]).to eq("200") 
    expect(@scores.yesterday[:data][0]["date"]).to eq(Date.today.prev_day.strftime("%Y-%m-%d"))
  end

  it "returns a 200 status when requesting scores for a specific date" do
    expect(@scores.on("2021-02-25")[:status]).to eq("200") 
    expect(@scores.on("2021-02-25")[:data][0]["date"]).to eq("2021-02-25")
  end
end