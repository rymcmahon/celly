require 'net/http'
require 'json'

class Celly::Team
  BASE_URL = 'https://statsapi.web.nhl.com/api/v1'

  def roster(id)
    end_point = "/teams/#{id}/roster"
    uri = URI("#{BASE_URL}#{end_point}")
    response = Net::HTTP.get_response(uri)

    if response.code == '200'
      json_response = JSON.parse(response.body)
      
      {status: response.code, message: response.message, data: json_response["roster"]}
    else
      {status: response.code, message: response.message}
    end
  end

  def schedule(start_date, end_date, team_id)
    end_point = "/schedule?startDate=#{start_date}&endDate=#{end_date}&teamId=#{team_id}"
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