require 'faraday'

module WalkscoreApi
  class Client
    BASE_URL = 'http://api.walkscore.com'
    API_KEY = "8a89b90e602ea73543053787f6bd7a6b"

    def initialize
      @connection = Faraday.new(BASE_URL)
    end

    def make_connection(attributes)
      response = @connection.get do |req|
        req.url '/score'
        req.headers['Accepts'] = 'application/json'
        req.params['format'] = 'json'
        req.params['lat'] = attributes[:lat]
        req.params['lon'] = attributes[:long]
        req.params['wsapikey'] = API_KEY
      end
      response.body
    end
  end
end