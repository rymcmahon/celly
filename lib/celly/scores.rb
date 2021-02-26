require 'net/http'
require 'json'
require 'date'

class Celly::Scores
  BASE_URL = 'https://statsapi.web.nhl.com/api/v1'
  
  def today
    today = DateTime.now.strftime("%Y-%m-%d")
    end_point = "/schedule?startDate=#{today}&endDate=#{today}"
    uri = URI("#{BASE_URL}#{end_point}")
    response = Net::HTTP.get_response(uri)

    if response.code == '200'
      json_response = JSON.parse(response.body)
      {status: response.code, message: response.message, data: json_response["dates"]}
    else
      {status: response.code, message: response.message}
    end
  end
end