# Celly

Celly is a Ruby wrapper for the NHL Stats API, a little-known, undocumented API maintained by the National Hockey League. Celly aims to provide an easy-to-use DSL for making requests to the NHL Stats API and retrieving data about Teams, Players, Schedules, and Standings.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'celly'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install celly

## Usage

Celly has four main classes (as of now)—Player, Team, Standings, and Schedule. Using the gem is a simple as instantiating a class and calling the available methods:

```ruby
  irb(main):002:0> player = Celly::Player.new
  => #<Celly::Player:0x000000011db23776>

  irb(main):003:0> player.profile(8478402)
  => {:status=>"200", :message=>"OK", :data=>[{"id"=>8478402, "fullName"=>"Connor McDavid", "link"=>"/api/v1/people/8478402", "firstName"=>"Connor", "lastName"=>"McDavid", "primaryNumber"=>"97", "birthDate"=>"1997-01-13", "currentAge"=>24, "birthCity"=>"Richmond Hill", "birthStateProvince"=>"ON", "birthCountry"=>"CAN", "nationality"=>"CAN", "height"=>"6' 1\"", "weight"=>193, "active"=>true, "alternateCaptain"=>false, "captain"=>true, "rookie"=>false, "shootsCatches"=>"L", "rosterStatus"=>"Y", "currentTeam"=>{"id"=>22, "name"=>"Edmonton Oilers", "link"=>"/api/v1/teams/22"}, "primaryPosition"=>{"code"=>"C", "name"=>"Center", "type"=>"Forward", "abbreviation"=>"C"}}]}

  irb(main):004:0> team = Celly::Team.new
  => #<Celly::Team:0x000000011dc25123>

  irb(main):005:0> team.stats(7)
  => {:status=>"200", :message=>"OK", :data=>[{"type"=>{"displayName"=>"statsSingleSeason", "gameType"=>{"id"=>"R", "description"=>"Regular season", "postseason"=>false}}, "splits"=>[{"stat"=>{"gamesPlayed"=>15, "wins"=>5, "losses"=>8, "ot"=>2, "pts"=>12, "ptPctg"=>"40.0", "goalsPerGame"=>2.333, "goalsAgainstPerGame"=>3.0, "evGGARatio"=>0.6, "powerPlayPercentage"=>"32.6", "powerPlayGoals"=>16.0, "powerPlayGoalsAgainst"=>8.0, "powerPlayOpportunities"=>49.0, "penaltyKillPercentage"=>"75.8", "shotsPerGame"=>30.0667, "shotsAllowed"=>28.5333, "winScoreFirst"=>0.6, "winOppScoreFirst"=>0.2, "winLeadFirstPer"=>0.667, "winLeadSecondPer"=>1.0, "winOutshootOpp"=>0.429, "winOutshotByOpp"=>0.25, "faceOffsTaken"=>833.0, "faceOffsWon"=>450.0, "faceOffsLost"=>383.0, "faceOffWinPercentage"=>"54.0", "shootingPctg"=>7.8, "savePctg"=>0.895}, "team"=>{"id"=>7, "name"=>"Buffalo Sabres", "link"=>"/api/v1/teams/7"}}]}, {"type"=>{"displayName"=>"regularSeasonStatRankings", "gameType"=>nil}, "splits"=>[{"stat"=>{"wins"=>"30th", "losses"=>"25th", "ot"=>"20th", "pts"=>"30th", "ptPctg"=>"28th", "goalsPerGame"=>"28th", "goalsAgainstPerGame"=>"21st", "evGGARatio"=>"30th", "powerPlayPercentage"=>"4th", "powerPlayGoals"=>"8th", "powerPlayGoalsAgainst"=>"8th", "powerPlayOpportunities"=>"26th", "penaltyKillOpportunities"=>"1st", "penaltyKillPercentage"=>"23rd", "shotsPerGame"=>"16th", "shotsAllowed"=>"8th", "winScoreFirst"=>"30th", "winOppScoreFirst"=>"25th", "winLeadFirstPer"=>"23rd", "winLeadSecondPer"=>"13th", "winOutshootOpp"=>"24th", "winOutshotByOpp"=>"24th", "faceOffsTaken"=>"28th", "faceOffsWon"=>"22nd", "faceOffsLost"=>"2nd", "faceOffWinPercentage"=>"2nd", "savePctRank"=>"24th", "shootingPctRank"=>"26th"}, "team"=>{"id"=>7, "name"=>"Buffalo Sabres", "link"=>"/api/v1/teams/7"}}]}]}
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Testing

Celly uses RSpec for testing. To run the tests, run `bundle exec rspec` 

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/rymcmahon/celly.


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
