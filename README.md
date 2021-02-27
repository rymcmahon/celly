![kane-celly](https://user-images.githubusercontent.com/8561395/109370958-90721d00-7870-11eb-9ae5-ee0bd881fc3d.gif)

# Celly

Celly is a Ruby wrapper for the NHL Stats API, a little-known, undocumented API maintained by the National Hockey League. Celly aims to provide an easy-to-use DSL for making requests to the NHL Stats API and retrieving data about Teams, Players, Schedules, and Standings.

## Installation

Add this line to your application's Gemfile:

    $ gem 'celly'

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install celly

## Usage

Celly has six classes (as of now)—Player, Leaders, Scores, Team, Standings, and Schedule. Using the gem is a simple as instantiating a class and calling the available methods:

Get a player's profile:
```bash
irb(main):002:0> player = Celly::Player.new
=> #<Celly::Player:0x000000011db23776>

irb(main):003:0> player.profile(8478402)
=> {:status=>"200", :message=>"OK", :data=>[{"id"=>8478402, "fullName"=>"Connor McDavid", "link"=>"/api/v1/people/8478402", "firstName"=>"Connor", "lastName"=>"McDavid", "primaryNumber"=>"97", "birthDate"=>"1997-01-13", "currentAge"=>24, "birthCity"=>"Richmond Hill", "birthStateProvince"=>"ON", "birthCountry"=>"CAN", "nationality"=>"CAN", "height"=>"6' 1\"", "weight"=>193, "active"=>true, "alternateCaptain"=>false, "captain"=>true, "rookie"=>false, "shootsCatches"=>"L", "rosterStatus"=>"Y", "currentTeam"=>{"id"=>22, "name"=>"Edmonton Oilers", "link"=>"/api/v1/teams/22"}, "primaryPosition"=>{"code"=>"C", "name"=>"Center", "type"=>"Forward", "abbreviation"=>"C"}}]}
```

Get a team's stats:

```bash
irb(main):004:0> team = Celly::Team.new
=> #<Celly::Team:0x000000011dc25123>

irb(main):005:0> team.stats(7)
=> {:status=>"200", :message=>"OK", :data=>[{"type"=>{"displayName"=>"statsSingleSeason", "gameType"=>{"id"=>"R", "description"=>"Regular season", "postseason"=>false}}, "splits"=>[{"stat"=>{"gamesPlayed"=>15, "wins"=>5, "losses"=>8, "ot"=>2, "pts"=>12, "ptPctg"=>"40.0", "goalsPerGame"=>2.333, "goalsAgainstPerGame"=>3.0, "evGGARatio"=>0.6, "powerPlayPercentage"=>"32.6", "powerPlayGoals"=>16.0, "powerPlayGoalsAgainst"=>8.0, "powerPlayOpportunities"=>49.0, "penaltyKillPercentage"=>"75.8", "shotsPerGame"=>30.0667, "shotsAllowed"=>28.5333, "winScoreFirst"=>0.6, "winOppScoreFirst"=>0.2, "winLeadFirstPer"=>0.667, "winLeadSecondPer"=>1.0, "winOutshootOpp"=>0.429, "winOutshotByOpp"=>0.25, "faceOffsTaken"=>833.0, "faceOffsWon"=>450.0, "faceOffsLost"=>383.0, "faceOffWinPercentage"=>"54.0", "shootingPctg"=>7.8, "savePctg"=>0.895}, "team"=>{"id"=>7, "name"=>"Buffalo Sabres", "link"=>"/api/v1/teams/7"}}]}, {"type"=>{"displayName"=>"regularSeasonStatRankings", "gameType"=>nil}, "splits"=>[{"stat"=>{"wins"=>"30th", "losses"=>"25th", "ot"=>"20th", "pts"=>"30th", "ptPctg"=>"28th", "goalsPerGame"=>"28th", "goalsAgainstPerGame"=>"21st", "evGGARatio"=>"30th", "powerPlayPercentage"=>"4th", "powerPlayGoals"=>"8th", "powerPlayGoalsAgainst"=>"8th", "powerPlayOpportunities"=>"26th", "penaltyKillOpportunities"=>"1st", "penaltyKillPercentage"=>"23rd", "shotsPerGame"=>"16th", "shotsAllowed"=>"8th", "winScoreFirst"=>"30th", "winOppScoreFirst"=>"25th", "winLeadFirstPer"=>"23rd", "winLeadSecondPer"=>"13th", "winOutshootOpp"=>"24th", "winOutshotByOpp"=>"24th", "faceOffsTaken"=>"28th", "faceOffsWon"=>"22nd", "faceOffsLost"=>"2nd", "faceOffWinPercentage"=>"2nd", "savePctRank"=>"24th", "shootingPctRank"=>"26th"}, "team"=>{"id"=>7, "name"=>"Buffalo Sabres", "link"=>"/api/v1/teams/7"}}]}]}
```

Want today's scores?

```bash
irb(main):006:0> scores = Celly::Scores.new
  => #<Celly::Scores:0x000000011db23776>

irb(main):007:0> scores.today
=> {:status=>"200", :message=>"OK", :data=>[{"date"=>"2021-02-26", "totalItems"=>1, "totalEvents"=>0, "totalGames"=>3, "totalMatches"=>0, "games"=>[{"gamePk"=>2020020323, "link"=>"/api/v1/game/2020020323/feed/live", "gameType"=>"R", "season"=>"20202021", "gameDate"=>"2021-02-27T00:00:00Z", "status"=>{"abstractGameState"=>"Live", "codedGameState"=>"3", "detailedState"=>"In Progress", "statusCode"=>"3", "startTimeTBD"=>false}, "teams"=>{"away"=>{"leagueRecord"=>{"wins"=>11, "losses"=>4, "ot"=>2, "type"=>"league"}, "score"=>0, "team"=>{"id"=>6, "name"=>"Boston Bruins", "link"=>"/api/v1/teams/6"}}, "home"=>{"leagueRecord"=>{"wins"=>6, "losses"=>8, "ot"=>3, "type"=>"league"}, "score"=>0, "team"=>{"id"=>3, "name"=>"New York Rangers", "link"=>"/api/v1/teams/3"}}}, "venue"=>{"id"=>5054, "name"=>"Madison Square Garden", "link"=>"/api/v1/venues/5054"}, "content"=>{"link"=>"/api/v1/game/2020020323/content"}}], "events"=>[], "matches"=>[]}]}
```

Get the current scoring leaders:

```bash
irb(main):005:0> leaders = Celly::Leaders.new
=> #<Celly::Leaders:0x000000013b6913b0>

irb(main):006:0> leaders.points(20202021)
=> {:status=>"200", :message=>"OK", :data=>[{"leaderCategory"=>"points", "depth"=>"singleSeason", "playerStatus"=>"allPlayers", "season"=>"2020-2021", "gameType"=>{"id"=>"R", "description"=>"Regular season", "postseason"=>false}, "limitMetadata"=>{"limit"=>5, "offset"=>0, "additionalTies"=>0}, "leaders"=>[{"rank"=>1, "value"=>"40", "team"=>{"id"=>22, "name"=>"Edmonton Oilers", "link"=>"/api/v1/teams/22"}, "person"=>{"id"=>8478402, "fullName"=>"Connor McDavid", "link"=>"/api/v1/people/8478402"}}, {"rank"=>2, "value"=>"34", "team"=>{"id"=>22, "name"=>"Edmonton Oilers", "link"=>"/api/v1/teams/22"}, "person"=>{"id"=>8477934, "fullName"=>"Leon Draisaitl", "link"=>"/api/v1/people/8477934"}}, {"rank"=>3, "value"=>"31", "team"=>{"id"=>10, "name"=>"Toronto Maple Leafs", "link"=>"/api/v1/teams/10"}, "person"=>{"id"=>8479318, "fullName"=>"Auston Matthews", "link"=>"/api/v1/people/8479318"}}, {"rank"=>3, "value"=>"31", "team"=>{"id"=>16, "name"=>"Chicago Blackhawks", "link"=>"/api/v1/teams/16"}, "person"=>{"id"=>8474141, "fullName"=>"Patrick Kane", "link"=>"/api/v1/people/8474141"}}, {"rank"=>5, "value"=>"30", "team"=>{"id"=>10, "name"=>"Toronto Maple Leafs", "link"=>"/api/v1/teams/10"}, "person"=>{"id"=>8478483, "fullName"=>"Mitchell Marner", "link"=>"/api/v1/people/8478483"}}]}]}
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
