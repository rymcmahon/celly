require 'net/http'
require 'json'

module Celly
  class Leaders
    BASE_URL = 'https://statsapi.web.nhl.com/api/v1'

    def goals(season)
      end_point = "/stats/leaders?leaderCategories=goals&season#{season}"
      uri = URI("#{BASE_URL}#{end_point}")
      response = Net::HTTP.get_response(uri)

      if response.code == '200'
        json_response = JSON.parse(response.body)
        { status: response.code, message: response.message, data: json_response['leagueLeaders'] }
      else
        { status: response.code, message: response.message }
      end
    end

    def assists(season)
      end_point = "/stats/leaders?leaderCategories=assists&season#{season}"
      uri = URI("#{BASE_URL}#{end_point}")
      response = Net::HTTP.get_response(uri)

      if response.code == '200'
        json_response = JSON.parse(response.body)
        { status: response.code, message: response.message, data: json_response['leagueLeaders'] }
      else
        { status: response.code, message: response.message }
      end
    end

    def points(season)
      end_point = "/stats/leaders?leaderCategories=points&season#{season}"
      uri = URI("#{BASE_URL}#{end_point}")
      response = Net::HTTP.get_response(uri)

      if response.code == '200'
        json_response = JSON.parse(response.body)
        { status: response.code, message: response.message, data: json_response['leagueLeaders'] }
      else
        { status: response.code, message: response.message }
      end
    end

    def shutouts(season)
      end_point = "/stats/leaders?leaderCategories=shutouts&season#{season}"
      uri = URI("#{BASE_URL}#{end_point}")
      response = Net::HTTP.get_response(uri)

      if response.code == '200'
        json_response = JSON.parse(response.body)
        { status: response.code, message: response.message, data: json_response['leagueLeaders'] }
      else
        { status: response.code, message: response.message }
      end

    end

    def wins(season)
      end_point = "/stats/leaders?leaderCategories=wins&season#{season}"
      uri = URI("#{BASE_URL}#{end_point}")
      response = Net::HTTP.get_response(uri)

      if response.code == '200'
        json_response = JSON.parse(response.body)
        { status: response.code, message: response.message, data: json_response['leagueLeaders'] }
      else
        { status: response.code, message: response.message }
      end
    end
  end
end
