require 'net/http'
require 'json'

class Celly::Team
  BASE_URL = 'https://statsapi.web.nhl.com/api/v1'

  def all
    end_point = "/teams"
    uri = URI("#{BASE_URL}#{end_point}")
    response = Net::HTTP.get_response(uri)

    if response.code == '200'
      json_response = JSON.parse(response.body)
      
      {status: response.code, message: response.message, data: json_response["teams"] }
    else
      {status: response.code, message: response.message}
    end
  end

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

  def find(id)
    end_point = "/teams/#{id}"
    uri = URI("#{BASE_URL}#{end_point}")
    response = Net::HTTP.get_response(uri)

    if response.code == '200'
      json_response = JSON.parse(response.body)
      
      {status: response.code, message: response.message, data: json_response["teams"]}
    else
      {status: response.code, message: response.message}
    end
  end

  def stats(id)
    end_point = "/teams/#{id}/stats"
    uri = URI("#{BASE_URL}#{end_point}")
    response = Net::HTTP.get_response(uri)

    if response.code == '200'
      json_response = JSON.parse(response.body)
      
      {status: response.code, message: response.message, data: json_response["stats"]}
    else
      {status: response.code, message: response.message}
    end
  end
end