require 'net/http'
require 'json'

class Celly::Standings
  BASE_URL = 'https://statsapi.web.nhl.com/api/v1'

  def overall(season)
    end_point = "/standings?#{season}"
    uri = URI("#{BASE_URL}#{end_point}")
    response = Net::HTTP.get_response(uri)

    if response.code == '200'
      json_response = JSON.parse(response.body)
      
      {status: response.code, message: response.message, data: json_response["records"]}
    else
      {status: response.code, message: response.message}
    end
  end
end