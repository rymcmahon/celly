require 'net/http'
require 'json'

class Celly::Player
  BASE_URL = 'https://statsapi.web.nhl.com/api/v1'
  def profile(id)
    end_point = "/people/#{id}"
    uri = URI("#{BASE_URL}#{end_point}")
    response = Net::HTTP.get_response(uri)

    if response.code == '200'
      json_response = JSON.parse(response.body)
      {status: response.code, message: response.message, data: json_response['people']}
    else
      {status: response.code, message: response.message}
    end
  end

  def season_stats(player_id, season)
    end_point = "/people/#{player_id}/stats?stats=statsSingleSeason&season=#{season}"
    uri = URI("#{BASE_URL}#{end_point}")
    response = Net::HTTP.get_response(uri)

    if response.code == '200'
      json_response = JSON.parse(response.body)
      {status: response.code, message: response.message, data: json_response['stats'][0]['splits'][0]['stat']}
    else
      {status: response.code, message: response.message}
    end
  end

  def regular_season_career_stats(player_id)
    end_point = "/people/#{player_id}/stats?stats=careerRegularSeason"
    uri = URI("#{BASE_URL}#{end_point}")
    response = Net::HTTP.get_response(uri)

    if response.code == '200'
      json_response = JSON.parse(response.body)
      {status: response.code, message: response.message, data: json_response['stats'][0]['splits'][0]['stat']}
    else
      {status: response.code, message: response.message}
    end
  end

  def playoffs_career_stats(player_id)
    end_point = "/people/#{player_id}/stats?stats=careerPlayoffs"
    uri = URI("#{BASE_URL}#{end_point}")
    response = Net::HTTP.get_response(uri)

    if response.code == '200'
      json_response = JSON.parse(response.body)
      {status: response.code, message: response.message, data: json_response['stats'][0]['splits'][0]['stat']}
    else
      {status: response.code, message: response.message}
    end
  end

  def playoffs_stats_by_year(player_id)
    end_point = "/people/#{player_id}/stats?stats=yearByYearPlayoffs"
    uri = URI("#{BASE_URL}#{end_point}")
    response = Net::HTTP.get_response(uri)

    if response.code == '200'
      json_response = JSON.parse(response.body)

      {status: response.code, message: response.message, data: json_response['stats'][0]['splits']}
    else
      {status: response.code, message: response.message}
    end
  end
end
