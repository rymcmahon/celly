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

Celly has six classes (as of now)—Player, Leaders, Scores, Team, Standings, and Schedule. Using the gem is a simple as instantiating a class and calling the available methods.

For example, to get a player's profile...
```ruby
player = Celly::Player.new

player.profile(8478402)
=> {:status=>"200", :message=>"OK", :data=>[{"id"=>8478402, "fullName"=>"Connor McDavid", "link"=>"/api/v1/people/8478402", "firstName"=>"Connor", "lastName"=>"McDavid", "primaryNumber"=>"97", "birthDate"=>"1997-01-13", "currentAge"=>24, "birthCity"=>"Richmond Hill", "birthStateProvince"=>"ON", "birthCountry"=>"CAN", "nationality"=>"CAN", "height"=>"6' 1\"", "weight"=>193, "active"=>true, "alternateCaptain"=>false, "captain"=>true, "rookie"=>false, "shootsCatches"=>"L", "rosterStatus"=>"Y", "currentTeam"=>{"id"=>22, "name"=>"Edmonton Oilers", "link"=>"/api/v1/teams/22"}, "primaryPosition"=>{"code"=>"C", "name"=>"Center", "type"=>"Forward", "abbreviation"=>"C"}}]}
```

...or to get a team's stats:

```ruby
team = Celly::Team.new

team.stats(7)
=> {:status=>"200", :message=>"OK", :data=>[{"type"=>{"displayName"=>"statsSingleSeason", "gameType"=>{"id"=>"R", "description"=>"Regular season", "postseason"=>false}}, "splits"=>[{"stat"=>{"gamesPlayed"=>15, "wins"=>5, "losses"=>8, "ot"=>2, "pts"=>12, "ptPctg"=>"40.0", "goalsPerGame"=>2.333, "goalsAgainstPerGame"=>3.0, "evGGARatio"=>0.6, "powerPlayPercentage"=>"32.6", "powerPlayGoals"=>16.0, "powerPlayGoalsAgainst"=>8.0, "powerPlayOpportunities"=>49.0, "penaltyKillPercentage"=>"75.8", "shotsPerGame"=>30.0667, "shotsAllowed"=>28.5333...]}
```

## All Current Classes & Methods

### Player

```ruby
player = Celly::Player.new

player.profile(id)                              # => player's personal information
player.season_stats(player_id, season)          # => player's stats for a regular season (season format: 20192020)
player.regular_season_career_stats(player_id)   # => player's career regular season stats
player.playoffs_career_stats(player_id)         # => player's career playoff stats
player.playoffs_stats_by_year(player_id)        # => player's playoff stats for each year
```

### Team
```ruby
team = Celly::Team.new

team.all                                        # => all teams' profiles
team.roster(id)                                 # => team's current roster
team.find(id)                                   # => team's profile
team.stats(id)                                  # => team's current season stats
```

### Scores
```ruby
scores = Celly::Scores.new

scores.today                                    # => today's scores
scores.yesterday                                # => yesterday's scores
scores.on(date)                                 # => scores on a specific date (date format: "2021-02-25")
```

### Leaders
```ruby
leaders = Celly::Leaders.new

leaders.goals(season)                           # => goal leaders per season (season format: 20202021)
leaders.assists(season)                         # => assist leaders per season
leaders.points(season)                          # => point leaders per season
leaders.wins(season)                            # => goalie wins per season
leaders.shutouts(season)                        # => goalie shutouts per season
```

### Standings
```ruby
standings = Celly::Standings.new

standings.overall(season)                       # => season standings (season format: 20202021)
```

### Schedule
```ruby
schedule = Celly::Schedule.new

standings.all(start_date, end_date)            # => overall season standings (date format: "2020-02-25")
standings.team(start_date, end_date, team_id)  # => team's season standings (date format: "2020-02-25")
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
